-- guías visuales de indentación
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        indent = {
            enabled = true,
            scope = { enabled = false },
            filter = function(buf)
                return vim.bo[buf].filetype ~= "dashboard"
            end,
        },
    },
}
