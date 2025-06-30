---------------------------------------------------------------------
-------------------------- PREFACE ---------------------------------
---------------------------------------------------------------------

-- vscode neovim
if (vim.g.vscode) then
    require('vscode-neovim/init')
    return
end

-- set leader
vim.g.mapleader = " "

---------------------------------------------------------------------
--------------------------- PLUGINS ---------------------------------
---------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

---------------------------------------------------------------------
--------------------------- OPTIONS ---------------------------------
---------------------------------------------------------------------
-- disable netrw at the very start of your init.lua for nvim-tree (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"


-- copilot
vim.g.copilot_assume_mapped = true

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

-- set cursorline
vim.cmd("set cursorline")
---------------------------------------------------------------------
--------------------------- MAPPINGS --------------------------------
---------------------------------------------------------------------
-- jj or jk to escape insert mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

-- no more :W
vim.keymap.set("n", "<leader>;", ":")
vim.keymap.set("v", "<leader>;", ":")

-- split pane
vim.keymap.set("n", "<leader>c", "<cmd>:vsplit<CR>")

-- move up and down half page puts cursor in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- go back and forth history centers cursor
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

-- moving lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- toggle absolute line numbers
vim.keymap.set("n", "<leader>ln", ":set rnu!<CR>")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- save hehe
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- disable Q
-- vim.keymap.set("n", "Q", "<nop>")

-- vsplit
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")

-- hack to get nvim tree to work (if its not loaded, then won't work)
vim.keymap.set("n", '<C-n>', '<cmd>lua require("nvim-tree.api").tree.toggle({focus = false})<CR>')

-- lazygit open in new window
vim.keymap.set("n", "<leader>gg", ":!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { silent = true })

-- github copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- buffers
vim.keymap.set("n", "<leader>br", "<cmd>:bufdo e!<cr>") -- buffer reload
vim.keymap.set("n", "<leader>bc", "<cmd>:bd|e#<cr>")    -- delete all buffers but current

vim.keymap.set("n", "<leader>bf", "<cmd>:!echo -n % | pbcopy<cr>")

-- easy word replace
vim.keymap.set("n", "<leader>P", "viwP")

-- switch file (see which one I use more)
vim.keymap.set("n", "<C-f>", "<C-6>")
vim.keymap.set("n", "<C-k>", "<C-6>")

-- lsp
vim.keymap.set("n", "gd", "<cmd>:lua vim.lsp.buf.definition()<CR>")
-- Removed to use telescope
-- vim.keymap.set("n", "gr", "<cmd>:lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>:lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>:lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("v", "<leader>.", "<cmd>:lua vim.lsp.buf.range_code_action()<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>:lua vim.lsp.buf.rename()<cr>") -- rename symbol (rr = refactor rename)

-- diagnostics
vim.keymap.set("n", "<leader>do", "<cmd>:lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "<leader>d]", "<cmd>:lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "<leader>d[", "<cmd>:lua vim.diagnostic.goto_next()<cr>")

---------------------------------------------------------------------
--------------------------- AUTOCOMMANDS ----------------------------
---------------------------------------------------------------------

vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "dart" },
        command = "setlocal ts=2 sts=2 sw=2 expandtab",
    }
)

-- allow lua line to show recording macro status instantly
vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require('lualine').refresh({
            place = { "statusline" },
        })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
            50,
            0,
            vim.schedule_wrap(function()
                require('lualine').refresh({
                    place = { "statusline" },
                })
            end)
        )
    end,
})

---------------------------------------------------------------------
--------------------------- VISUALS ---------------------------------
---------------------------------------------------------------------
vim.cmd('colorscheme github_dark_dimmed')
vim.cmd('hi SignColumn guibg=NONE') -- remove sign column background

---------------------------------------------------------------------
--------------------------- MY FUNCTIONS ----------------------------
---------------------------------------------------------------------

-- reveal current buffer in finder
vim.api.nvim_create_user_command('Rfinder',
    function()
        local path = vim.api.nvim_buf_get_name(0)
        os.execute('open -R ' .. path)
    end,
    {}
)
-- toggle quickfix list
local is_quickfix_list_open = false
function ToggleQuickfixList()
    if is_quickfix_list_open then
        vim.cmd("cclose")
        is_quickfix_list_open = false
    else
        vim.cmd("copen")
        is_quickfix_list_open = true
    end
end

vim.keymap.set("n", "<leader>qo", "<cmd>lua ToggleQuickfixList()<cr>")
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<cr>")
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<cr>")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.lsp.enable("ruff")
vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")
