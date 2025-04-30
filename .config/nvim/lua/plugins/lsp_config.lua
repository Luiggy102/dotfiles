-- first we need to configure our custom server
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

configs.protobuf_language_server = {
	default_config = {
		cmd = { "protobuf-language-server" },
		filetypes = { "proto", "cpp" },
		root_dir = util.root_pattern(".git"),
		single_file_support = true,
		settings = {},
	},
}

-- then we can continue as we do with official servers
local lspconfig = require("lspconfig")
lspconfig.protobuf_language_server.setup({
	-- your custom stuff
})

local lspconfig = require("lspconfig")
local mapsOpts = { noremap = true, silent = true }

local on_attach = function(_, _)
	------------ atajos por defecto nvim -----------------------
	-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
	-- vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action)
	-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	-- vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)

	------------ reemplazos de lsp saga -----------------------
	vim.keymap.set("n", "<C-<kPoint>>", ":Lspsaga code_action<cr>")
	vim.keymap.set("n", "gd", ":Lspsaga goto_definition<cr>", mapsOpts)
	vim.keymap.set("n", "K", ":Lspsaga hover_doc<cr>", mapsOpts)
	vim.keymap.set("n", "<space>rn", ":Lspsaga rename<cr>", mapsOpts)
end
----------- nuevo para suprimir las advertencias virtual tex
vim.diagnostic.config({
	virtual_text = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
	require("mason").setup(),
	require("mason-lspconfig").setup({
		ensure_installed = {
			-- golang
			"gopls",
			"golangci_lint_ls",
			-- bash
			"bashls",
			-- jsonls
			"jsonls",
			-- lua
			"lua_ls",
			-- "stylua",
			-- cpp
			"clangd",
			-- latex
			"ltex",
			"texlab",
			-- php
			"intelephense",
			-- web
			"html",
			"tsserver",
			"angularls",
			"cssls",
			-- docker
			"docker_compose_language_service",
			"dockerls",
			"yamlls",
			-- sql
			"sqlls",
			-- protobuf
			"bufls",
			-- c#
			"csharp_ls",
			"omnisharp",
			-- emmet
			"emmet_ls",
		},
	}),

	lspconfig["omnisharp"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"css",
			"eruby",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"svelte",
			"pug",
			"typescriptreact",
			"vue",
		},
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		},
	}),

	lspconfig["intelephense"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["angularls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		-- filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
	}),

	lspconfig["bufls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "proto" },
	}),

	lspconfig["sqlls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["docker_compose_language_service"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "yaml" },
	}),

	lspconfig["yamlls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "yaml" },
	}),

	lspconfig["dockerls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html" },
	}),

	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		-- init_options = {
		-- 	hostInfo = "neovim",
		-- },
		-- on_new_config = function(new_config, new_root_dir)
		-- 	local local_ts = new_root_dir .. "/node_modules/typescript/lib"
		-- 	if vim.fn.filereadable(local_ts .. "/tsserverlibrary.js") == 1 then
		-- 		new_config.init_options.tsserver = {
		-- 			path = local_ts,
		-- 		}
		-- 	end
		-- end,
	}),

	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["clangd"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "c", "cpp" },
	}),

	lspconfig["jsonls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["gopls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotml" },
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
		},
	}),

	lspconfig["texlab"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	}),

	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	}),

	lspconfig["ltex"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "latex", "tex" },
		settings = {
			["ltex"] = {
				enabled = { "latex", "bibtex", "tex" },
				language = "es",
			},
		},
	}),
}
