local lspconfig = require('lspconfig')
local mapsOpts = { noremap = true, silent = true }

local on_attach = function(_, _)
    ------------ atajos por defecto nvim -----------------------
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)

    ------------ reemplazos de lsp saga -----------------------
    vim.keymap.set('n', 'gd', ':Lspsaga goto_definition<cr>', mapsOpts)
    vim.keymap.set('n', 'K', ':Lspsaga hover_doc<cr>', mapsOpts)
    vim.keymap.set('n', '<space>rn', ':Lspsaga rename<cr>', mapsOpts)
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
            -- golang
            "gopls",
            -- bash
            "bashls",
            -- jsonls
            "jsonls",
            -- lua
            "lua_ls",
            -- rust
            "rust_analyzer"
        }
    }),

    lspconfig['gopls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotml' },
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                }
            }
        }
    }),

    lspconfig['rust_analyzer'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'rust' },
        settings = {
            ['rust_analyzer'] = {
                cargo = {
                    allFeatures = true,
                }
            }
        }
    }),

    lspconfig['bashls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    }),

    lspconfig['jsonls'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    }),

    lspconfig['tsserver'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    }),

    lspconfig['html'].setup({
        capabilities = capabilities,
        on_attach = on_attach,
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
