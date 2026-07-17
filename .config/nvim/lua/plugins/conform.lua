-- formateador de código automático al guardar
return {
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
}
