-- gestor de instalación de lsp servers/herramientas
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        -- "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- bash
                "bashls",
                -- jsonls
                "jsonls",
                -- lua
                "lua_ls",
                -- "stylua",
                -- latex
                "ltex",
                "texlab",
                -- web
                "html",
                "angularls",
                "cssls",
                -- docker
                "docker_compose_language_service",
                "dockerls",
                "yamlls",
                -- sql
                "sqlls",
                -- c#
                "omnisharp",
                -- emmet
                "emmet_ls",
            },
        })
    end,
}
