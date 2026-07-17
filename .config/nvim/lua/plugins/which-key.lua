-- muestra popup con atajos de teclado disponibles
return {
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
}
