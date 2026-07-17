-- scrollbar con marcadores de diagnosticos (errores/warnings) y cambios git
return {
    "petertriho/nvim-scrollbar",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        require("scrollbar").setup({
            handlers = {
                diagnostic = true,
                gitsigns = true,
            },
        })
        require("scrollbar.handlers.gitsigns").setup()
    end,
}
