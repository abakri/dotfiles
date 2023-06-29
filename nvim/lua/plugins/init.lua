return {
    -- vim tutorial
    'ThePrimeagen/vim-be-good',

    -- color schemes
    "EdenEast/nightfox.nvim",
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
    {
        "franbach/miramare",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme miramare")
        end,
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = {
            char = "▏",
            -- for example, context is off by default, use this to turn it on
            show_current_context = true,
        }
    },

    -- navigation
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    "christoomey/vim-tmux-navigator",
    {
        "nvim-tree/nvim-web-devicons",
        config = {
            {
                -- your personnal icons can go here (to override)
                -- you can specify color or cterm_color instead of specifying both of them
                -- DevIcon will be appended to `name`
                override = {
                    zsh = {
                        icon = "",
                        color = "#428850",
                        cterm_color = "65",
                        name = "Zsh"
                    }
                },
                -- globally enable different highlight colors per icon (default to true)
                -- if set to false all icons will have the default icon's color
                color_icons = true,
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true,
                -- globally enable "strict" selection of icons - icon will be looked up in
                -- different tables, first by filename, and if not found by extension; this
                -- prevents cases when file doesn't have any extension but still gets some icon
                -- because its name happened to match some extension (default to false)
                strict = true,
                -- same as `override` but specifically for overrides by filename
                -- takes effect when `strict` is true
                override_by_filename = {
                    [".gitignore"] = {
                        icon = "",
                        color = "#f1502f",
                        name = "Gitignore"
                    }
                },
                -- same as `override` but specifically for overrides by extension
                -- takes effect when `strict` is true
                override_by_extension = {
                    ["log"] = {
                        icon = "",
                        color = "#81e043",
                        name = "Log"
                    }
                },
            }
        }
    },

    {
        'ThePrimeagen/harpoon',
        config = {
            menu = {
                width = math.floor(vim.api.nvim_win_get_width(0) * 0.65),
            }
        }
    },

    -- copilot
    "github/copilot.vim",

    -- test runner
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            'sidlatau/neotest-dart',
        },
        keys = {
            { 'leaderTr', '<cmd>lua require("neotest").run.run()<CR>',                    desc = 'Neotest run' },
            { 'leaderTd', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>',  desc = 'Neotest run with dap' },
            { 'leaderTf', '<cmd> lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Neotest run file' },
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-dart') {
                        command = 'fvm flutter', -- Command being used to run tests. Defaults to `flutter`
                        use_lsp = true           -- When set Flutter outline information is used when constructing test name.
                    },
                }
            })
        end
    },

    -- split/join
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter' },
    },

    -- git
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

    -- status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = {
            options = {
                component_separators = '|',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { { color = { bg = '#2B2426' } } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
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
    },

    -- nvimtree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly",                   -- optional, updated every week. (see issue #1193)
        config = {
            disable_netrw = true,
            hijack_netrw = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            view = {
                centralize_selection = true,
                adaptive_size = false,
                side = "right",
                preserve_window_proportions = true,
                float = {
                    enable = true,
                    quit_on_focus_loss = false,
                    open_win_config = function()
                        return {
                            row = 0,
                            width = 40,
                            border = "rounded",
                            relative = "editor",
                            col = vim.o.columns,
                            height = vim.o.lines,
                        }
                    end,
                },
            },
            filters = {
                dotfiles = false,
            },
            git = {
                enable = true,
                ignore = false,
            }
        }
    },

    -- noice cmd line (not using notifications)
    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
        config = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
        },
    },

    -- dap (debugger)
    {
        "theHamsta/nvim-dap-virtual-text",
        config = {
            commented = true,
        }
    },
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        keys = {
            { '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = 'DAP toggle breakpoint' },
        },
        config = function()
            local dap_breakpoint = {
                error = {
                    text = "B",
                    texthl = "LspDiagnosticsSignError",
                    linehl = "",
                    numhl = "",
                },
                rejected = {
                    text = "",
                    texthl = "LspDiagnosticsSignHint",
                    linehl = "",
                    numhl = "",
                },
                stopped = {
                    text = ">",
                    texthl = "LspDiagnosticsSignInformation",
                    linehl = "DiagnosticUnderlineInfo",
                    numhl = "LspDiagnosticsSignInformation",
                },
            }

            vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
            vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
            vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({})

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            dap.adapters.dart = {
                type = "executable",
                command = "/Users/aslan/opt/flutter/bin/flutter",
                args = { "debug_adapter" }
            }

            dap.configurations = {
                dart = {
                    type = "dart",
                    request = "launch",
                    name = "Launch Dart Program",
                    -- The nvim-dap plugin populates this variable with the filename of the current buffer
                    program = "${file}",
                    -- The nvim-dap plugin populates this variable with the editor's current working directory
                    cwd = "${workspaceFolder}",
                    args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
                }
            }
        end
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },

    -- Flutter
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = {
            fvm = true,
            dev_tools = {
                autostart = true,
                auto_open_browser = true,
            },
            widget_guides = {
                enabled = true,
                debug = true,
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
            },
        },
    },

    -- treesitter and lsp
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
        config = {
            -- A list of parser names, or "all" (the four listed parsers should always be installed)
            ensure_installed = { "javascript", "python", "typescript", "c", "lua", "bash", "toml", "json" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = {
            enable = true,
            max_lines = 3,
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black, -- python code formatting
                    null_ls.builtins.formatting.isort, -- python import sorting
                }
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
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
        },
        config = function()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = true,
            })

            lsp.ensure_installed({
                "tsserver",
                "rust_analyzer",
                "pyright",
                "jsonls",
            })

            lsp.configure("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            lsp.configure("pyright", {
                settings = {
                    python = {
                        analysis = {
                            autoImportCompletions = true,
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "off",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            lsp.setup()
        end
    },
}
