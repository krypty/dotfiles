-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then
    return {
        -- add gruvbox
        { "ellisonleao/gruvbox.nvim" },

        { "Morozzzko/git_browse.nvim" },

        -- add robot framework syntax highlight
        { "seeamkhan/robotframework-vim" },

        -- Helpers for UNIX (e.g. SudoWrite)
        { "tpope/vim-eunuch" },

        {
            "rachartier/tiny-inline-diagnostic.nvim",
            opts = {
                event = "VeryLazy", -- Or `LspAttach`
                priority = 1000,    -- needs to be loaded in first
                config = function()
                    require('tiny-inline-diagnostic').setup()
                    vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
                end
            },
        },

        {
            "nvim-lspconfig",
            opts = {
                diagnostics = {
                    virtual_text = false,
                },
            },
        },

        -- EditorConfig
        { "gpanders/editorconfig.nvim" },

        -- -- Range, pattern and substitute preview for Vim
        -- { "markonm/traces.vim" },

        -- Switch between header and source
        {
            "derekwyatt/vim-fswitch",
            lazy = true,
            event = "BufEnter *.cpp"
        },
        {
            "mfussenegger/nvim-lint",
            opts = {
                linters = {
                    ["markdownlint-cli2"] = {
                        args = { "--config", "/home/gary/dotfiles/markdownlint-cli2/.markdownlint-cli2.yaml", "--" },
                    },
                },
            },
        },

        -- { "justinmk/vim-sneak" },

        { "tpope/vim-fugitive" },

        -- Configure LazyVim to load gruvbox
        {
            "LazyVim/LazyVim",
            opts = {
                colorscheme = "gruvbox",
            },
        },

        -- Show hidden file in neo-tree
        {
            "nvim-neo-tree/neo-tree.nvim",
            dependencies = {
                {
                    "ten3roberts/window-picker.nvim",
                    name = "window-picker",
                    config = function()
                        local picker = require("window-picker")
                        picker.setup()
                        picker.pick_window = function()
                            return picker.select({ hl = "WindowPicker", prompt = "Pick window: " }, function(winid)
                                if not winid then
                                    return nil
                                else
                                    return winid
                                end
                            end)
                        end
                    end,
                },
            },
            opts = {
                filesystem = {
                    bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
                    filtered_items = {
                        visible = true,
                        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                            ".DS_Store",
                            "thumbs.db",
                            "__pycache__",
                        },
                        never_show_by_pattern = { -- uses glob style patterns
                            ".null-ls_*",
                            "*.pyc",
                        },
                    },
                    follow_current_file = {
                        enabled = false,
                        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                    },
                },
                buffers = {
                    follow_current_file = {
                        enabled = false,        -- This will find and focus the file in the active buffer every time
                        -- the current file is changed while the tree is open.
                        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                    },
                },
            },
        },

        { "ray-x/go.nvim" },

        {
            "kdheepak/lazygit.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            }
        },

        {
            "stevearc/conform.nvim",
            opts = {
                formatters_by_ft = {
                    java = { "google-java-format" },
                    lua = { "luals" },
                    fish = { "fish_indent" },
                    sh = { "shfmt" },
                    sql = { "pg_format" },
                },
            }
        },

        -- Kill a buffer without closing its window
        { "moll/vim-bbye" },

        -- disable persistence plugin
        { "folke/persistence.nvim",           enabled = false },

        -- disable yanky plugin
        { "gbprod/yanky.nvim",                enabled = false },

        -- disable aerial plugin
        { "stevearc/aerial.nvim",             enabled = false },
        --
        -- disable symbols-outline plugin
        { "simrat39/symbols-outline.nvim",    enabled = false },

        -- disable venv selector plugin
        { "linux-cultist/venv-selector.nvim", enabled = false },
        --
        -- disable edgy plugin
        { "folke/edgy.nvim",                  enabled = false },

        -- disable project plugin
        { "ahmedkhalf/project.nvim",          enabled = false },

        -- add makeit (Makefile)
        {
            "Zeioth/makeit.nvim",
            cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
            dependencies = { "stevearc/overseer.nvim" },
            opts = {},
        },
        {
            "stevearc/overseer.nvim",
            commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
            cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
            opts = {
                task_list = {
                    direction = "bottom",
                    min_height = 25,
                    max_height = 25,
                    default_detail = 1
                },
            },
        },

        {
            "ckipp01/nvim-jenkinsfile-linter",
            dependencies = {
                "nvim-lua/plenary.nvim",
            }
        },
    }
end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    -- disable trouble
    { "folke/trouble.nvim",                             enabled = false },

    -- add symbols-outline
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },

    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},
            },
        },
    },

    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
            })
        end,
    },

    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },

    -- Use <tab> for completion and snippets (supertab)
    -- first: disable default <tab> and <s-tab> behavior in LuaSnip
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
    -- then: setup supertab in cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require("luasnip")
            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- this way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
        end,
    },
}
