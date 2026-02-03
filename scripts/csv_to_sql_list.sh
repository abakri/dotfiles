#!/bin/bash

# Script to convert a CSV column to SQL list format: ('val1', 'val2', 'val3')
# Usage: ./csv_to_sql_list.sh <csv_file> <column_name_or_number>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <csv_file> <column_name_or_number>"
    echo "Example: $0 data.csv email"
    echo "Example: $0 data.csv 3"
    exit 1
fi

CSV_FILE="$1"
COLUMN="$2"

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' not found"
    exit 1
fi

# Read the header to determine column index
HEADER=$(head -n 1 "$CSV_FILE")

# Check if COLUMN is a number or a column name
if [[ "$COLUMN" =~ ^[0-9]+$ ]]; then
    COL_NUM="$COLUMN"
else
    # Find column number by name (case-insensitive)
    COL_NUM=$(echo "$HEADER" | awk -F',' -v col="$COLUMN" '
    {
        for(i=1; i<=NF; i++) {
            gsub(/^[ \t]+|[ \t]+$/, "", $i)  # trim whitespace
            gsub(/^"|"$/, "", $i)             # remove quotes
            if (tolower($i) == tolower(col)) {
                print i
                exit
            }
        }
    }')

    if [ -z "$COL_NUM" ]; then
        echo "Error: Column '$COLUMN' not found in CSV"
        echo "Available columns: $HEADER"
        exit 1
    fi
fi

# Extract column values (skip header) and format as SQL list
awk -F',' -v col="$COL_NUM" '
NR > 1 {
    # Get the column value
    val = $col
    # Remove leading/trailing whitespace
    gsub(/^[ \t]+|[ \t]+$/, "", val)
    # Remove surrounding quotes if present
    gsub(/^"|"$/, "", val)
    # Escape single quotes by doubling them
    gsub(/'\''/, "'\'''\''", val)
    # Skip empty values
    if (val != "") {
        values[++count] = val
    }
}
END {
    printf "("
    for (i=1; i<=count; i++) {
        printf "'\''%s'\''", values[i]
        if (i < count) printf ", "
    }
    printf ")\n"
}
' "$CSV_FILE"
