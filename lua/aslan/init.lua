---------------------------------------------------------------------
--------------------------- OPTIONS ---------------------------------
---------------------------------------------------------------------
-- disable netrw at the very start of your init.lua (strongly advised)
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

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"

-- set leader
vim.g.mapleader = " "

-- copilot
vim.g.copilot_assume_mapped = true

---------------------------------------------------------------------
--------------------------- MAPPINGS --------------------------------
---------------------------------------------------------------------
-- jj or jk to escape insert mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

-- move up and down half page puts cursor in middle
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- moving lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- harpoon
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>`", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_next()<CR>")

-- nvimtree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- netrw disabled
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>")

-- github copilot
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- lsp
vim.keymap.set("n", "<leader>f", "<cmd>:LspZeroFormat<CR>")

-- git diff
vim.keymap.set("n", "<leader>d", "<cmd>:DiffviewOpen<CR>")
vim.keymap.set("n", "<leader><Esc>", "<cmd>:tabclose<CR>")

---------------------------------------------------------------------
--------------------------- AUTOCOMMANDS ----------------------------
---------------------------------------------------------------------

vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
        command = "setlocal ts=2 sts=2 sw=2 expandtab",
    }
)
