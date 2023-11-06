return {
    require("nvim-tree").setup({
        view = {
            -- side = 'right'
        },
        filters = {
            dotfiles = true,
        },
        renderer = {
            indent_markers = { enable = false }
        }
    })
}
