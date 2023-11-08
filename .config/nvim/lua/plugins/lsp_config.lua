local lspconfig = require('lspconfig')

local on_attach = function(_, _)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
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
            "tsserver",
            "lua_ls",
            "jsonls",
        }
    }),
    lspconfig['tsserver'].setup({
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
