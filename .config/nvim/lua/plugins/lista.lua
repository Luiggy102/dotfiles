return {
	-- lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	-- para folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
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
	-- emmet
	{ "https://github.com/mattn/emmet-vim" },
	-- { "https://github.com/aca/emmet-ls" },
	-- diagnosticos
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- autocompletado
	{ "ziontee113/icon-picker.nvim", opts = { disable_legacy_commands = true } },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- compartir los snippets de sql con mysql
			require("luasnip").filetype_extend("mysql", { "sql" })
			require("luasnip").filetype_extend("plsql", { "sql" })
			require("luasnip").filetype_extend("javascriptreact", { "html" })
			require("luasnip").filetype_extend("javascriptreact", { "css" })
			require("luasnip").filetype_extend("typescript", { "html" })
			require("luasnip").filetype_extend("typescript", { "css" })
			require("luasnip").filetype_extend("html", { "css" })
			-- require("luasnip").filetype_extend("htmlangular", { "html" })
			-- require("luasnip").filetype_extend("htmlangular", { "css" })
		end,
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
			"https://github.com/kristijanhusak/vim-dadbod-completion", --db
		},
	},

	-- ide
	"windwp/nvim-autopairs",
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			filters = {
				enable = true,
				dotfiles = false,
			},
			git = {
				enable = true,
			},
			renderer = {
				-- root_folder_label = true,
				-- root_folder_label = ":~:s?$?/..?",
				root_folder_label = ":~:s?.*/??",
				-- root_folder_label = vim.fn.getcwd():match("([^/\\]+)/*$"),
				indent_markers = {
					enable = true,
				},
			},
			view = {
				side = "right",
				width = 30,
			},
			diagnostics = {
				enable = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
	},
	"tpope/vim-fugitive",
	{ "stevearc/dressing.nvim", opts = {} },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "numToStr/Comment.nvim", lazy = false, opts = {} },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- { "https://github.com/dlvandenberg/tree-sitter-angular" },
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
					fps = 60,
					timeout = 5000,
					-- minimum_width = 30,
					max_width = 40,
					-- el estilo
					render = "wrapped-compact",
					-- render = "compact",
					-- animación
					-- stages = "static",
					--stages = "fade_in_slide_out",
					stages = "slide",
					top_down = false, -- notificacion abajo
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				hide_filename_extension = false,
				-- los por defecto
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- son los a,b,c - x,y,z
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- component_separators = { left = "", right = "" },
			},
			sections = {
				-- verison completa
				-- lualine_a = {
				-- 	"mode",
				-- 	{
				-- 		"buffers",
				-- 		icons_enabled = false,
				-- 		hide_filename_extension = false,
				-- 		use_mode_colors = false,
				-- 		-- oxocarbon
				-- 		-- buffers_color = {
				-- 		-- 	active = { bg = "#ee5396" },
				-- 		-- 	inactive = { bg = "#82cfff" },
				-- 		-- },
				-- 		symbols = {
				-- 			modified = " ●",
				-- 			alternate_file = "",
				-- 			directory = "",
				-- 		},
				-- 	},
				-- },
				-- lualine_b = { "branch", "diff", "diagnostics" },
				-- lualine_c = {},
				-- lualine_x = {},
				-- lualine_y = { "progress" },
				-- lualine_z = { "location" },

				-- minimalista
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { { "buffers" } },
				lualine_x = { { "filetype" } },
				lualine_y = {},
				lualine_z = {},
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
			disable = {
				buftypes = {},
				filetypes = { "dbui" },
			},
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
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	event = {
	-- 		"BufReadPre",
	-- 		"BufNewFile",
	-- 	},
	-- 	config = function()
	-- 		local lint = require("lint")
	-- 		lint.linters_by_ft = {
	-- 			go = { "golangcilint" },
	-- 		}
	-- 	end,
	-- 	-- init = function()
	-- 	-- 	vim.cmd([[au BufWritePost * lua require('lint').try_lint()]])
	-- 	-- end,
	-- },
	-- -- linting
	--
	-- navegacion
	"alexghergh/nvim-tmux-navigation",
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		init = function()
			vim.cmd([[highlight LeapBackdrop guifg=#777777]])
			require("leap").create_default_mappings()
		end,
		opts = {},
	},
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
	{ "nyoom-engineering/oxocarbon.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- telescope sin borders
			on_highlights = function(hl, c)
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
			end,
		},
	},
	-- extras lenguajes
	-- cs
	{
		"iabdelkareem/csharp.nvim",
		dependencies = {
			"williamboman/mason.nvim", -- Required, automatically installs omnisharp
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
		},
		config = function()
			require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
			require("csharp").setup()
		end,
	},
	-- csv
	{ "chrisbra/csv.vim" },
	-- dbs
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_winwidth = 25
		end,
	},
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup()
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			-- vim.g.vimtex_compiler_method = "latexrun"
			vim.g.vimtex_compiler_method = "tectonic"
			-- vim.g.maplocalleader = ","
		end,
	},
	-- lectura/escritura (wiki)
	{
		"vimwiki/vimwiki",
		dependencies = {
			"mattn/calendar-vim",
		},
		init = function()
			-- desacartivar teclas
			-- vim.g.vimwiki_key_mappings = {
			-- 	all_maps = 0,
			-- 	global = 0,
			-- }
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
