"""
Simple PostgreSQL query module.

Reads database configurations from ~/.dbs.json and provides a simple
query interface.

Example ~/.dbs.json:
{
    "my_db_1": {
        "host": "localhost",
        "port": 5432,
        "database": "myapp",
        "user": "postgres",
        "password": "password123"
    },
    "my_db_2": {
        "host": "localhost",
        "port": 5432,
        "database": "otherapp",
        "user": "postgres",
        "password": "secret"
    }
}

Usage:
    import db

    query1 = "SELECT col_a FROM my_table"
    result = db.query("my_db_1", query1)
"""

import json
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple
import psycopg2
from psycopg2.extras import RealDictCursor


def _load_config() -> Dict[str, Dict[str, Any]]:
    """Load database configurations from ~/.dbs.json."""
    config_path = Path.home() / ".dbs.json"

    if not config_path.exists():
        raise FileNotFoundError(
            f"Database configuration file not found: {config_path}\n"
            "Create ~/.dbs.json with your database configurations."
        )

    with open(config_path, 'r') as f:
        return json.load(f)


def query(
    db_name: str,
    sql: str,
    params: Optional[Tuple] = None
) -> List[Dict[str, Any]]:
    """
    Execute a SQL query and return results as a list of dictionaries.

    Args:
        db_name: Name of the database from ~/.dbs.json
        sql: SQL query to execute (use %s for parameters)
        params: Optional tuple of parameters for parameterized queries

    Returns:
        List of dictionaries where keys are column names

    Example:
        results = db.query("my_db_1", "SELECT * FROM users WHERE id = %s", (123,))
    """
    config = _load_config()

    if db_name not in config:
        available = ", ".join(config.keys())
        raise KeyError(
            f"Database '{db_name}' not found. Available: {available}"
        )

    db_config = config[db_name]

    conn = None
    try:
        conn = psycopg2.connect(
            host=db_config.get('host', 'localhost'),
            port=db_config.get('port', 5432),
            database=db_config['database'],
            user=db_config['user'],
            password=db_config.get('password', '')
        )

        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(sql, params)
            results = cursor.fetchall()
            return [dict(row) for row in results]

    finally:
        if conn:
            conn.close()


def execute(
    db_name: str,
    sql: str,
    params: Optional[Tuple] = None,
    commit: bool = True
) -> int:
    """
    Execute a non-SELECT query (INSERT, UPDATE, DELETE, etc.).

    Args:
        db_name: Name of the database from ~/.dbs.json
        sql: SQL query to execute
        params: Optional tuple of parameters
        commit: Whether to commit the transaction (default: True)

    Returns:
        Number of rows affected

    Example:
        rows = db.execute("my_db_1", "UPDATE users SET active = %s WHERE id = %s", (False, 123))
    """
    config = _load_config()

    if db_name not in config:
        available = ", ".join(config.keys())
        raise KeyError(
            f"Database '{db_name}' not found. Available: {available}"
        )

    db_config = config[db_name]

    conn = None
    try:
        conn = psycopg2.connect(
            host=db_config.get('host', 'localhost'),
            port=db_config.get('port', 5432),
            database=db_config['database'],
            user=db_config['user'],
            password=db_config.get('password', '')
        )

        with conn.cursor() as cursor:
            cursor.execute(sql, params)
            rowcount = cursor.rowcount

            if commit:
                conn.commit()

            return rowcount

    finally:
        if conn:
            conn.close()
