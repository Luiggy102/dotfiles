-- guarda y restaura la sesion (buffers, layout) por directorio
return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "~/", "~/Downloads", "/" },
    },
}
