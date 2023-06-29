local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- vim tutorial
    use 'ThePrimeagen/vim-be-good'

    -- color schemes
    use "EdenEast/nightfox.nvim"
    use "navarasu/onedark.nvim"
    use "folke/tokyonight.nvim"
    use "franbach/miramare"

    use("christoomey/vim-tmux-navigator")

    -- indent lines
    use "lukas-reineke/indent-blankline.nvim"

    use "shortcuts/no-neck-pain.nvim"

    -- navigation
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'ThePrimeagen/harpoon'
    use {
        "folke/flash.nvim",
        requires = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require('flash').setup({
                -- disable 'f' and 't' with flash
                modes = {
                    char = {
                        enabled = false,
                    }
                },
                label = {
                    format = function(opts)
                        return {
                            {
                                "[" .. opts.match.label .. "]",
                                opts.match.hl_group,
                            }
                        }
                    end
                }
            })
        end
    }

    use "nvim-tree/nvim-web-devicons"

    -- copilot
    use "github/copilot.vim"

    -- vim surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- test runner
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            'sidlatau/neotest-dart',
        },
    }

    -- split/join
    use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter' },
    })

    -- git
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- status bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- nvimtree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly"                    -- optional, updated every week. (see issue #1193)
    }

    -- noice cmd line (not using notifications)
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        }
    })

    -- dap (debugger)
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use "nvim-telescope/telescope-dap.nvim"
    use {
        "mfussenegger/nvim-dap",
        requires = {
            "nvim-telescope/telescope-dap.nvim",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
    }

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    -- Flutter
    use "stevearc/dressing.nvim"
    use {
        "akinsho/flutter-tools.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
    }

    -- treesitter and lsp
    use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })
    use 'nvim-treesitter/nvim-treesitter-context'
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    --[[ A bit too buggy for now
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }
    --]]
    -- docstrings
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


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

vim.opt.hlsearch = false
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

-- insert line below without entering insert mode
vim.keymap.set("n", "<C-j>", "o<Esc>")
vim.keymap.set("n", "<C-k>", "O<Esc>")

-- toggle absolute line numbers
vim.keymap.set("n", "<leader>l", ":set rnu!<CR>")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- resizing panes
vim.keymap.set("n", "<C-w>h", "<C-w>5>")
vim.keymap.set("n", "<C-w>l", "<C-w>5<")

-- save hehe
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- split/join
vim.keymap.set("n", "gs", "<cmd>lua require('treesj').toggle()<CR>")

-- harpoon
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>`", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>")

-- nvimtree
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- netrw disabled
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFindFile<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>")

-- lazygit open in new window
vim.keymap.set("n", "<leader>gg", ":!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { silent = true })

-- github copilot
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- lsp
vim.keymap.set("n", "gd", "<cmd>:lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gr", "<cmd>:lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>:lua vim.lsp.buf.format({ timeout_ms = 5000 })<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>:lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("v", "<leader>.", "<cmd>:lua vim.lsp.buf.range_code_action()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>:lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "<leader>d]", "<cmd>:lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "<leader>d[", "<cmd>:lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "<leader>vr", "<cmd>:lua vim.lsp.buf.rename()<cr>")

-- diffview
vim.keymap.set("n", "<leader>dv", "<cmd>:DiffviewOpen<CR>")
vim.keymap.set("n", "<leader><Esc>", "<cmd>:tabclose<CR>")

-- Flutter
vim.keymap.set("n", "<leader>Fr", "<cmd>:FlutterRun --flavor dev<CR>")
vim.keymap.set("n", "<leader>Fo", "<cmd>:FlutterOutlineToggle<CR>")

---------------------------------------------------------------------
--------------------------- AUTOCOMMANDS ----------------------------
---------------------------------------------------------------------

vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = { "javascript", "typescript", "typescriptreact", "javascriptreact", "dart" },
        command = "setlocal ts=2 sts=2 sw=2 expandtab",
    }
)
