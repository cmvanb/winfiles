--------------------------------------------------------------------------------
-- Plugin configuration
--------------------------------------------------------------------------------

return {

    -- General
    ----------------------------------------------------------------------------

    -- Sugar for UNIX shell commands.
    { 'tpope/vim-eunuch' },

    -- Mini plugins collection.
    {
        'echasnovski/mini.nvim',
        config = function()
            do_load('plugins/mini/comment')
            do_load('plugins/mini/pairs')
        end
    },

    -- Keymap helper
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup({
                icons = {
                    mappings = false,
                },
            })
        end
    },


    -- Session management
    ----------------------------------------------------------------------------

    {
        'Shatur/neovim-session-manager',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            do_load('plugins/session')
        end
    },


    -- Buffer management
    ----------------------------------------------------------------------------

    -- Better buffer deletion
    { 'famiu/bufdelete.nvim' },

    -- Redirect command output to new buffer.
    { 'sbulav/nredir.nvim' },


    -- Git integration
    ----------------------------------------------------------------------------

    -- Git messenger
    {
        'rhysd/git-messenger.vim',
        config = function()
            vim.g.git_messenger_no_default_mappings = true
        end,
    },


    -- LSP
    ----------------------------------------------------------------------------

    -- Package management for LSP tooling such as language servers, debuggers,
    -- linters and formatters.
    {
        'williamboman/mason.nvim',
        config = function()
            local ThemeConfig = reload('theme.config')

            reload('mason').setup({
                ui = {
                    border = ThemeConfig.border,
                },
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'mason.nvim',
        },
    },

    -- LSP configuration. Also configure mason-lspconfig.
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'mason-lspconfig.nvim',
        },
        config = function()
            do_load('plugins/lsp')
        end,
    },


    -- Completion
    ----------------------------------------------------------------------------

    -- Github Copilot
    {
        'github/copilot.vim',
    },

    -- Snippet engine.
    {
        'L3MON4D3/LuaSnip',
        config = function()
            reload('luasnip').setup({
                history = true,
                update_events = 'TextChanged,TextChangedI',
            })
        end,
    },

    -- Various snippets.
    {
        'rafamadriz/friendly-snippets',
        dependencies = { 'L3MON4D3/LuaSnip' },
        config = function()
            reload('luasnip.loaders.from_vscode').lazy_load()
        end,
    },

    -- Completion tooling.
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' },
        config = function()
            do_load('plugins/completion')
        end
    },

    -- Completion sources.
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'f3fora/cmp-spell' },


    -- Syntax highlighting
    ----------------------------------------------------------------------------

    -- Treesitter.
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = reload('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            do_load('plugins/treesitter')
        end
    },
    { 'nvim-treesitter/playground' },

    -- Syntax rules.
    { 'khaveesh/vim-fish-syntax' },
    { 'camnw/lf-vim' },
    { 'LnL7/vim-nix' },
    { 'ziglang/zig.vim' },
    { 'imsnif/kdl.vim' },

    -- Cursor highlight
    { 'RRethy/vim-illuminate' },

    -- Formatting
    ----------------------------------------------------------------------------

    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            reload('treesj').setup({
                use_default_keymaps = false,
            })
        end,
    },

    -- {
    --     'stevearc/conform.nvim',
    --     config = function()
    --         require('conform').setup({
    --             formatters_by_ft = {
    --                 css = { 'prettierd' },
    --                 -- javascript = { 'prettierd' },
    --                 -- javascriptreact = { 'prettierd' },
    --                 -- markdown = { 'prettierd' },
    --                 -- python = { 'black' },
    --                 -- rust = { 'rustfmt' },
    --                 -- yaml = { 'prettierd' },
    --             },
    --             format_on_save = {
    --                 timeout_ms = 500,
    --                 lsp_format = 'fallback',
    --             },
    --         })
    --     end,
    -- },


    -- Folding
    ----------------------------------------------------------------------------

    -- {
    --     'kevinhwang91/nvim-ufo',
    --     dependencies = { 'kevinhwang91/promise-async' },
    --     config = function()
    --         do_load('plugins/ufo')
    --     end,
    -- },
    -- {
    --     'chrisgrieser/nvim-origami',
    --     config = function()
    --         reload('origami').setup({
    --             setupFoldKeymaps = false,
    --         })
    --     end,
    -- },


    -- Search
    ----------------------------------------------------------------------------

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            do_load('plugins/telescope')
        end
    },
    {
        'nvim-telescope/telescope-symbols.nvim',
    },


    -- Viewing
    ----------------------------------------------------------------------------

    -- See color values in editor.
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            do_load('plugins/colorizer')
        end
    },

    -- Indentation
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            local ThemeSymbols = reload('theme.symbols')

            reload('ibl').setup({
                indent = {
                    char = ThemeSymbols.indent_char,
                },
                scope = {
                    enabled = true,
                }
            })
        end
    },


    -- Navigation
    ----------------------------------------------------------------------------

    -- Jump movement.
    {
        'ggandor/leap.nvim',
        config = function()
            reload('leap').setup({
                case_sensitive = true,
            })
        end
    },


    -- Editing
    ----------------------------------------------------------------------------

    -- Surround.
    -- sa: add, sd: delete, sr: replace
    -- ib: inner select, ab: outer select (VISUAL mode)
    { 'machakann/vim-sandwich' },

    -- easier digraphs
    -- :UnicodeName
    -- :UnicodeSearch
    -- :UnicodeTable
    -- :Digraphs
    {
        'chrisbra/unicode.vim',
        config = function()
            vim.g.Unicode_no_default_mappings = true
        end,
    },


    -- Status column
    ----------------------------------------------------------------------------

    {
        'luukvbaal/statuscol.nvim',
        config = function()
            do_load('plugins/statuscol')
        end
    },


    -- Sign column
    ----------------------------------------------------------------------------

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            local ThemeSymbols = reload('theme.symbols')

            reload('gitsigns').setup({
                -- Enable cursor line highlights (fixes missing background color
                -- in sign column)
                culhl = true,
                signs = {
                    add          = { text = ThemeSymbols.git_signs.add },
                    change       = { text = ThemeSymbols.git_signs.change },
                    delete       = { text = ThemeSymbols.git_signs.delete },
                    topdelete    = { text = ThemeSymbols.git_signs.topdelete },
                    changedelete = { text = ThemeSymbols.git_signs.changedelete },
                    untracked    = { text = ThemeSymbols.git_signs.untracked },
                },
            })
        end
    },


    -- Status line
    ----------------------------------------------------------------------------

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            'nvimdev/guard-collection',
        },
        config = function()
            do_load('plugins/lualine')
        end,
    },
}
