-- guarda y restaura la sesion (buffers, layout) por directorio
return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "~/", "~/Downloads", "/" },
        -- fix: al restaurar, forzar re-trigger de FileType para que treesitter/syntax resalte
        post_restore_cmds = {
            function()
                vim.cmd("bufdo e")
            end,
        },
    },
}
