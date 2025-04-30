local cmp = require("cmp")
local luasnip = require("luasnip")
local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = " ",
	Misc = " ",
}
return {
	-- require("luasnip.loaders.from_vscode").lazy_load(),
	require("luasnip.loaders.from_vscode").lazy_load({
		paths = {
			-- general
			string.format("%s/.local/share/nvim/lazy/friendly-snippets/", os.getenv("HOME")),
		},
	}),
	require("luasnip.loaders.from_vscode").lazy_load({
		include = { "typescript", "html", "css" },
		-- exclude = {},
		paths = {
			-- angular
			string.format("%s/.config/nvim/lua/snippets/vscode-angular-snippets/", os.getenv("HOME")),
			string.format("%s/.config/nvim/lua/snippets/angular-latest-snippets/", os.getenv("HOME")),
		},
	}),
	require("luasnip.loaders.from_vscode").lazy_load({
		include = { "html", "css" },
		-- exclude = {},
		paths = {
			-- bs5
			string.format("%s/.config/nvim/lua/snippets/B5-SNIPPETS/", os.getenv("HOME")),
		},
	}),
	require("luasnip.loaders.from_vscode").lazy_load({
		include = { "javascriptreact", "typescriptreact" },
		-- exclude = {},
		paths = {
			-- react
			string.format("%s/.config/nvim/lua/snippets/simple-react-snippets/", os.getenv("HOME")),
		},
	}),
	require("luasnip.loaders.from_vscode").lazy_load({
		include = { "php" },
		-- exclude = {},
		paths = {
			-- laravel
			string.format("%s/.config/nvim/lua/snippets/laravel5-snippets-vscode/snippets/", os.getenv("HOME")),
		},
	}),

	vim.keymap.set({ "i" }, "<C-K>", function()
		luasnip.expand()
	end, { silent = true }),
	vim.keymap.set({ "i", "s" }, "<C-L>", function()
		luasnip.jump(1)
	end, { silent = true }),
	vim.keymap.set({ "i", "s" }, "<C-J>", function()
		luasnip.jump(-1)
	end, { silent = true }),

	-- cambio con tab
	-- vim.keymap.set({ "i" }, "<Tab>", function()
	-- 	luasnip.expand()
	-- end, { silent = true }),
	-- vim.keymap.set({ "i", "s" }, "<Tab><tab>", function()
	-- 	luasnip.jump(1)
	-- end, { silent = true }),
	-- vim.keymap.set({ "i", "s" }, "<S-tab>", function()
	-- 	luasnip.jump(-1)
	-- end, { silent = true }),

	vim.keymap.set({ "i", "s" }, "<C-E>", function()
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		end
	end, { silent = true }),

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer", keyword_lenght = 3 },
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		window = {
			completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = true,
		},
	}),

	-- git commit
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" },
			{ name = "buffer" },
		}),
	}),

	cmp.setup.filetype({ "sql", "mysql" }, {
		sources = cmp.config.sources({
			{ name = "vim-dadbod-completion" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "luasnip" },
		}),
	}),

	-- vimwiki
	cmp.setup.filetype({ "vimwiki", "text" }, {
		sources = cmp.config.sources({
			{
				name = "spell",
				option = {
					keep_all_entries = false,
					enable_in_context = function()
						return true
					end,
				},
			},
			{ name = "buffer" },
			{ name = "path" },
		}),
	}),

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({}),
	}),

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	}),
}
