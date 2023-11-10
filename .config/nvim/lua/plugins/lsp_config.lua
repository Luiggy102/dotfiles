local lspconfig = require('lspconfig')

local on_attach = function(_, _)
    vim.keymap.set('n', '<space>hi', ':Lspsaga incoming_calls<cr>')
    vim.keymap.set('n', '<space>ho', ':Lspsaga outgoing_calls<cr>')

    vim.keymap.set('n', '<space>ca', ':Lspsaga code_action<cr>')

    vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<cr>')
    vim.keymap.set('n', '<space>gd', ':Lspsaga peek_definition<cr>')

    vim.keymap.set('n', '<space>D', ':Lspsaga goto_type_definition<cr>')

    vim.keymap.set('n', '<space>dn', ':Lspsaga diagnostic_jump_next<cr>')
    vim.keymap.set('n', '<space>dp', ':Lspsaga diagnostic_jump_prev<cr>')

    vim.keymap.set('n', '<space>fn', ':Lspsaga finder<cr>')

    vim.keymap.set('n', 'K', ':Lspsaga hover_doc<cr>')

    vim.keymap.set('n', '<space>gO', ':Lspsaga outline<cr>') -- o: saltar/abrir, e: entrar, q:salir

    vim.keymap.set('n', '<space>rn', ':Lspsaga rename<cr>')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
    require('mason').setup(),
    require('mason-lspconfig').setup({
        ensure_installed = {
            -- js/ts
            "tsserver",
            -- lua
            "lua_ls",
            -- json
            "jsonls",
            -- latex
            "ltex",
            "texlab",
        }
    }),
    lspconfig['tsserver'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    }),

    lspconfig['ltex'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ['ltex'] = {
                language = "es",
            }
        }
    }),

    lspconfig['texlab'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    }),

    lspconfig['jsonls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'json', 'jsonc' }
    }),

    lspconfig['lua_ls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            }
        },
    }),
}
