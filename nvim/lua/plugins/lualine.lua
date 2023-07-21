return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
        options = {
            component_separators = '|',
            section_separators = { left = '', right = '' },
            theme = {
                normal = {
                    a = { bg = "#2A2426" },
                    b = { bg = "#2A2426" },
                    c = { bg = "#2A2426" },
                }
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = {},
            lualine_x = {
                'encoding',
                'fileformat',
                'filetype',
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        tabline = {
            lualine_a = {},
            lualine_b = { { 'filename', file_status = true, path = 1 } },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
    }
}
