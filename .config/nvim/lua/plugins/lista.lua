return {
	-- lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
	},
	{

		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			hint_prefix = "󰌵 ",
			handler_opts = {
				-- double, rounded, single, shadow, none, or a table of borders
				border = "single",
			},
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- autocompletado
	{ "ziontee113/icon-picker.nvim", opts = { disable_legacy_commands = true } },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- lsp
			"hrsh7th/cmp-nvim-lsp", -- para lsp
			-- otros
			"saadparwaiz1/cmp_luasnip", -- para snippets
			"hrsh7th/cmp-buffer", -- para los bufers
			"hrsh7th/cmp-path", -- para rutas
			"hrsh7th/cmp-cmdline", -- para los comandos
			"kdheepak/cmp-latex-symbols", -- simbolos latex
		},
	},

	-- ide
	"windwp/nvim-autopairs",
	"tpope/vim-fugitive",
	{ "stevearc/dressing.nvim", opts = {} },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "numToStr/Comment.nvim", lazy = false, opts = {} },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				signature = {
					enabled = false,
				},
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					fps = 144,
					timeout = 1250,
					-- minimum_width = 30,
					max_width = 40,
					-- el estilo
					render = "wrapped-compact",
					-- animación
					-- stages = "static",
					--stages = "fade_in_slide_out",
					stages = "slide",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				-- son los a,b,c - x,y,z
				-- section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"buffers",
						icons_enabled = false,
						use_mode_colors = false,
						-- oxocarbon
						-- buffers_color = {
						-- 	active = { bg = "#ee5396" },
						-- 	inactive = { bg = "#82cfff" },
						-- },
						hide_filename_extension = false,
						symbols = {
							modified = " ●",
							alternate_file = "",
							directory = "",
						},
					},
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { exclude = { filetypes = { "dashboard" } } },
	},
	{
		"norcalli/nvim-colorizer.lua",
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
			layout = { align = "center" },
			ignore_missing = true,
		},
	},
	-- formateo
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			formatters_by_ft = {
				php = { "pretty-php" },
				go = { "gofmt" },
				lua = { "stylua" },
				cpp = { "clang-format " },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				php = { "phpcs" },
				go = { "golangcilint" },
			}
		end,
		-- init = function()
		-- 	vim.cmd([[au BufWritePost * lua require('lint').try_lint()]])
		-- end,
	},
	-- linting

	-- navegacion
	"alexghergh/nvim-tmux-navigation",
	"easymotion/vim-easymotion",
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
		},
		view_options = {
			show_hidden = true,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	-- esquema de color
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = false,
		},
	},
	"nyoom-engineering/oxocarbon.nvim",
	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = true,
			terminalColors = false,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
							bg_p1 = "none",
						},
					},
				},
			},
		},
	},
	-- extras lenguajes
	-- csv
	{ "chrisbra/csv.vim" },
	{
		"phpactor/phpactor",
		ft = "php",
		tag = "*",
		build = "composer install --no-dev -o",
	},
	-- lectura/escritura (wiki)
	{
		"vimwiki/vimwiki",
		dependencies = {
			"mattn/calendar-vim",
		},
		init = function()
			vim.cmd([[
                let g:vimwiki_global_ext = 0
                let g:vimwiki_list = []
                let g:vimwiki_list += [{
                  \ 'path': '~/vimwiki/wikis',
                  \ 'path_html': '~/vimwiki/html'
                  \ }]

                function! VimwikiLinkHandler(link)
                  let link = a:link
                  if link =~# '^vfile:'
                    let link = link[1:]
                  else
                    return 0
                  endif
                  let link_infos = vimwiki#base#resolve_link(link)
                  if link_infos.filename == ''
                    echomsg 'Vimwiki Error: Unable to resolve link!'
                    return 0
                  else
                    exe 'tabnew ' . fnameescape(link_infos.filename)
                    return 1
                  endif
                endfunction

            ]])
		end,
	},
}
