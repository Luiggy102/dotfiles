-- formateador de código automático al guardar
return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            cpp = { "clang-format" },
            markdown = { "prettier" }, -- sudo npm i -g prettier
        },
        format_on_save = function(bufnr)
            if vim.bo[bufnr].filetype ~= "markdown" then
                return
            end
            return { timeout_ms = 3000, lsp_format = "fallback" }
        end,
        -- format_on_save = function(bufnr)
        --     if vim.bo[bufnr].filetype == "cs" then
        --         return
        --     end
        --     return { lsp_format = "fallback", timeout_ms = 500 }
        -- end,
    },
}
