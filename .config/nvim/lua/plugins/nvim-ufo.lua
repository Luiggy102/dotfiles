-- plegado (folding) de código mejorado
return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            if vim.bo[bufnr].buftype ~= "" then
                return ""
            end
            return { "treesitter", "indent" }
        end,
        close_fold_kinds_for_ft = {
            default = {},
            cs = { "using_directive" },
            typescript = { "import_statement", "array" },
            typescriptreact = { "import_statement" },
            javascript = { "import_statement" },
            javascriptreact = { "import_statement" },
            go = { "import_declaration" },
            markdown = { "fenced_code_block" },
        },
    },
}
