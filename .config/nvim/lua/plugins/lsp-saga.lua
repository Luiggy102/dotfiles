-- ui mejorada para lsp (acciones, hover, definiciones, outline)
return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        -- "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- focos en acciones de código
        lightbulb = { enable = false, sign = false },
        -- barra de simbolos
        symbol_in_winbar = {
            enable = false,
            sign = true,
            virtual_text = true,
            priority = 100,
        },
    },
}
