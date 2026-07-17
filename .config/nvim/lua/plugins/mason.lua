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
                -- golang
                "gopls",
                "golangci_lint_ls",
                -- bash
                "bashls",
                -- jsonls
                "jsonls",
                -- lua
                "lua_ls",
                -- "stylua",
                -- cpp
                "clangd",
                -- latex
                "ltex",
                "texlab",
                -- php
                "intelephense",
                -- web
                "html",
                "tsserver",
                "angularls",
                "cssls",
                -- docker
                "docker_compose_language_service",
                "dockerls",
                "yamlls",
                -- sql
                "sqlls",
                -- protobuf
                "bufls",
                -- c#
                "csharp_ls",
                "omnisharp",
                -- emmet
                "emmet_ls",
            },
        })
    end,
}
