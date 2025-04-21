-- set leader
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pg", ":call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>ps", ":call VSCodeNotify('workbench.action.findInFiles')<CR>")
vim.keymap.set("n", "gd", ":call VSCodeNotify('editor.action.revealDefinition')<CR>")
vim.keymap.set("n", "gr", ":call VSCodeNotify('editor.action.goToReferences')<CR>")
vim.keymap.set("n", "<leader>f", ":call VSCodeNotify('editor.action.formatDocument')<CR>")
vim.keymap.set("n", "<leader>1", ":call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>")
vim.keymap.set("n", "<leader>2", ":call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>")
vim.keymap.set("n", "<leader>2", ":call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>")
vim.keymap.set("n", "<leader>3", ":call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>")
vim.keymap.set("n", "<leader>4", ":call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>")
vim.keymap.set("n", "<leader>5", ":call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>")
vim.keymap.set("n", "<leader>;", ":")
vim.keymap.set("v", "<leader>;", ":")
