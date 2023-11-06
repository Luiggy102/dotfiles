return {

    -- lsp
    {
        'williamboman/mason.nvim',
        dependencies = 'williamboman/mason-lspconfig.nvim'
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
        }
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
            'hrsh7th/cmp-nvim-lsp',       -- para lsp
            'saadparwaiz1/cmp_luasnip',   -- para snippets
            'hrsh7th/cmp-buffer',         -- para los bufers
            'hrsh7th/cmp-path',           -- para rutas
            'hrsh7th/cmp-cmdline',        -- para los comandos
            'micangl/cmp-vimtex',         -- para latex
            'hrsh7th/cmp-nvim-lua',       -- para lua
            'f3fora/cmp-spell',           -- para español
            'kdheepak/cmp-latex-symbols', -- symbolos latex
            {
                "David-Kunz/cmp-npm",     -- para node
                dependencies = { 'nvim-lua/plenary.nvim' },
                ft = "json",
                config = function()
                    require('cmp-npm').setup({})
                end
            },
        },
    },

    -- Ide
    -- { 'akinsho/bufferline.nvim',     version = "*",                            dependencies = 'nvim-tree/nvim-web-devicons',                                                                                           opts = {} },
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
        },
    },


    { 'akinsho/toggleterm.nvim',     version = "*",                            config = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = { exclude = { filetypes = { "dashboard", }, },
        },
    },
    { 'numToStr/Comment.nvim',           lazy = false,        opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'gruvbox',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' }
            }
        }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
    { 'stevearc/dressing.nvim',          opts = {}, },
    { 'lewis6991/gitsigns.nvim',         opts = {} },
    { 'tpope/vim-fugitive' },
    { 'karb94/neoscroll.nvim',           opts = {} },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end,
    },
    { 'niuiic/code-shot.nvim',     dependencies = { 'niuiic/core.nvim' },     opts = {} },
    { 'vuki656/package-info.nvim', dependencies = { 'MunifTanjim/nui.nvim' }, opts = {} },
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
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
        config = function()
            require('leap').add_default_mappings()
        end,

        opts = {},
    },
    'windwp/nvim-autopairs',
    'folke/zen-mode.nvim',

    -- navegacion
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim', }, },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons", },
    },
    'alexghergh/nvim-tmux-navigation',

    -- esquema de color
    'ellisonleao/gruvbox.nvim',
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
                    packages = { enable = false },
                    footer = {},
                    shortcut = {
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Directorio actual',
                            group = 'Busqueda',
                            action = 'Telescope find_files theme=ivy',
                            key = 'f',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'manuales',
                            group = 'Ayuda',
                            action = 'Telescope man_pages theme=ivy',
                            key = 'm',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Recientes',
                            group = 'Busqueda',
                            action = 'Telescope oldfiles theme=ivy',
                            key = 'h',
                        },
                    },
                    project = {
                        enable = true,
                        limit = 5,
                        label = 'Proyectos',
                        action = 'Telescope find_files theme=ivy cwd='
                    },
                    mru = { limit = 5, label = 'Archivos recientes' },
                    disable_move = true,
                }
            }
        end,
    },
}
