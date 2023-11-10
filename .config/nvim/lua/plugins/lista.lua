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
        'nvimdev/lspsaga.nvim', opts = { lightbulb = { enable = false } }
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
            'hrsh7th/cmp-nvim-lsp',     -- para lsp
            -- otros
            'petertriho/cmp-git',       -- para git
            'saadparwaiz1/cmp_luasnip', -- para snippets
            'hrsh7th/cmp-buffer',       -- para los bufers
            'hrsh7th/cmp-path',         -- para rutas
            'hrsh7th/cmp-cmdline',      -- para los comandos
            'f3fora/cmp-spell',         -- para español
            -- dependencias
            {
                "David-Kunz/cmp-npm", -- para node
                dependencies = { 'nvim-lua/plenary.nvim' },
                ft = "json",
                config = function()
                    require('cmp-npm').setup({})
                end
            },
            -- latex
            'micangl/cmp-vimtex',         -- para latex
            'kdheepak/cmp-latex-symbols', -- symbolos latex
        },
    },

    -- relacionado/epecifico a lenguage
    -- js/javascript
    { 'vuki656/package-info.nvim', dependencies = { 'MunifTanjim/nui.nvim' }, opts = {} },
    -- latex
    { 'lervag/vimtex' },

    -- ide
    'windwp/nvim-autopairs',
    'folke/zen-mode.nvim',
    'tpope/vim-fugitive',
    { 'akinsho/toggleterm.nvim',         version = "*",       config = true },
    { 'numToStr/Comment.nvim',           lazy = false,        opts = {} },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
    { 'stevearc/dressing.nvim',          opts = {}, },
    { 'lewis6991/gitsigns.nvim',         opts = {} },
    { 'karb94/neoscroll.nvim',           opts = {} },
    { 'nvim-lualine/lualine.nvim',       opts = {} },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            auto_hide = true,
            sidebar_filetypes = {
                NvimTree = true,
            },
            exclude_ft = { 'vimwiki' },
            exclude_name = { 'index.wiki' },
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
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim', }, },
    {
        {
            'ggandor/leap.nvim',
            dependencies = { 'tpope/vim-repeat' },
            config = function()
                require('leap').add_default_mappings()
            end,
            opts = {},
        },
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons", },
    },

    -- esquema de color
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                leap = true,
                mason = true,
                vimwiki = true,
                which_key = true,
            }
        }
    },

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
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
        config = function()
            require('dashboard').setup {
                -- config
                config = {
                    theme = 'hyper',
                    header = { " " },
                    packages = { enable = true },
                    footer = {},
                    shortcut = {
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'wiki',
                            group = 'Ayuda',
                            action = 'VimwikiIndex',
                            key = 'w',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Directorio actual',
                            group = 'Busqueda',
                            action = 'Telescope find_files theme=ivy',
                            key = 'f',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Recientes',
                            group = 'Busqueda',
                            action = 'Telescope oldfiles theme=ivy',
                            key = 'h',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Arbol de Archivos',
                            group = 'Busqueda',
                            action = 'NvimTreeOpen',
                            key = 'n',
                        },
                    },
                    project = {
                        enable = true,
                        limit = 5,
                        label = 'Proyectos',
                        action = 'Telescope find_files theme=ivy cwd='
                    },
                    mru = { limit = 5, label = 'Archivos recientes' },
                    disable_move = false,
                }
            }
        end,
    },
}
