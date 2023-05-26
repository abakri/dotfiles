local function ascii()
    return [[☆*:.｡.o(≧▽≦)o.｡.:*☆]]
end

require('lualine').setup({
    options = {
       theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = {},
        lualine_b = {{'filename', file_status=true, path=1}},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {ascii},
    }
})
