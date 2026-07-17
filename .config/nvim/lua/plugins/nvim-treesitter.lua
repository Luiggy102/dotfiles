-- resaltado de sintaxis e indentación basados en treesitter
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        vim.opt.runtimepath:append("$HOME/.local/share/treesitter")
        require("nvim-treesitter.configs").setup({
            parser_install_dir = "$HOME/.local/share/treesitter",
            ensure_installed = {
                -- languages
                -- extras
                "lua",
                "html",
                "bash",
                "json",
                "vimdoc",
                "markdown",
                "markdown_inline",
                -- git
                "git_config",
                "gitignore",
                "gitcommit",
                -- sql
                "sql",
            },
            auto_install = true,
            highlight = {
                enable = true,
                use_languagetree = false,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end,
}
