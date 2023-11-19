return {

    -- lsp
    { 'williamboman/mason.nvim',     dependencies = 'williamboman/mason-lspconfig.nvim' },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
        }
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'VeryLazy',
        opts = {
            hint_prefix = ' ',
            handler_opts = {
                border = 'single' -- double, rounded, single, shadow, none, or a table of borders
            },
        },
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- autocompletado
    { 'ziontee113/icon-picker.nvim', opts = { disable_legacy_commands = true } },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { 'rafamadriz/friendly-snippets' },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- lsp
            'hrsh7th/cmp-nvim-lsp',       -- para lsp
            -- otros
            'petertriho/cmp-git',         -- para git
            'saadparwaiz1/cmp_luasnip',   -- para snippets
            'hrsh7th/cmp-buffer',         -- para los bufers
            'hrsh7th/cmp-path',           -- para rutas
            'hrsh7th/cmp-cmdline',        -- para los comandos
            -- latex
            'micangl/cmp-vimtex',         -- para latex
            'kdheepak/cmp-latex-symbols', -- symbolos latex
        },
    },

    -- relacionado/epecifico a lenguage
    -- latex
    { 'lervag/vimtex' },

    -- ide
    'windwp/nvim-autopairs',
    'tpope/vim-fugitive',
    { 'stevearc/dressing.nvim',          opts = {}, },
    { 'akinsho/toggleterm.nvim',         version = "*",       config = true },
    { 'numToStr/Comment.nvim',           lazy = false,        opts = {} },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
    { 'lewis6991/gitsigns.nvim',         opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                section_separators = '',
                component_separators = ''
            }
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                renderer = {
                    indent_markers = {
                        enable = true,
                    }
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            }
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            auto_hide = true,
            exclude_ft = { 'vimwiki' },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = { exclude = { filetypes = { "dashboard", }, },
        },
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = {
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = false,
                    g = false,
                },
            },
            layout = { align = "center", },
            ignore_missing = true,
        },
    },

    -- navegacion
    'alexghergh/nvim-tmux-navigation',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-telescope/telescope-file-browser.nvim'
        },
    },
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        config = function()
            require('leap').add_default_mappings()
        end,
        opts = {},
    },

    -- esquema de color
    {
        'nyoom-engineering/oxocarbon.nvim',
        lazy = false,
        priority = 1000
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    'https://github.com/shaunsingh/nord.nvim',
    -- extras
    {
        'vimwiki/vimwiki',
        init = function()
            vim.cmd [[
                let g:vimwiki_list = []
                let g:vimwiki_list += [{
                  \ 'path': '~/Documents/personal/notas/vimwiki/',
                  \ 'path_html': '~/Documents/personal/notas/vimwiki/'
                  \ }]
            ]]
        end,
    },
}
