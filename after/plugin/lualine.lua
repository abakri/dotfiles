local function ascii()
    return [[☆*:.｡.o(≧▽≦)o.｡.:*☆]]
end

require('lualine').setup({
    options = {
        theme = 'tokyonight',
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
        lualine_b = {'filename'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {ascii},
    }
})
