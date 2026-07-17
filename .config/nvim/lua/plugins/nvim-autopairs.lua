-- autocierre de paréntesis, comillas, etc
return {
    "windwp/nvim-autopairs",
    opts = {
        disable_filetype = { "TelescopePrompt", "vim" },
        map_c_h = true,
    },
}
