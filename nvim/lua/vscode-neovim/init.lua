-- set leader
vim.g.mapleader = " "

-- options
vim.opt.clipboard = "unnamedplus"

-- keymaps

-- jj or jk to escape insert mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

-- grep and file search
vim.keymap.set("n", "<leader>pg", ":call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>ps", ":call VSCodeNotify('workbench.action.findInFiles')<CR>")

-- code actions
vim.keymap.set("n", "gd", ":call VSCodeNotify('editor.action.revealDefinition')<CR>")
vim.keymap.set("n", "gr", ":call VSCodeNotify('editor.action.goToReferences')<CR>")

-- format
vim.keymap.set("n", "<leader>f", ":call VSCodeNotify('editor.action.formatDocument')<CR>")

-- go to tab
vim.keymap.set("n", "<leader>1", ":call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>")
vim.keymap.set("n", "<leader>2", ":call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>")
vim.keymap.set("n", "<leader>2", ":call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>")
vim.keymap.set("n", "<leader>3", ":call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>")
vim.keymap.set("n", "<leader>4", ":call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>")
vim.keymap.set("n", "<leader>5", ":call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>")

-- open vim command line
vim.keymap.set("n", "<leader>;", ":")
vim.keymap.set("v", "<leader>;", ":")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
