return {
    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            -- "bash",
            -- "cpp",
            -- "csv",
            -- "git_config",
            -- "javascript",
            -- "json",
            -- "latex",
            -- "lua",
            -- "markdown",
            -- "r",
            -- "typescript",
        },
        auto_install = true,
        highlight = {
            enable = true,
            use_languagetree = false
        },
        indent = { enable = true }
    }
}
