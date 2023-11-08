return {
    require("nvim-tree").setup({
        view = {
            -- side = 'right'
        },
        filters = {
            dotfiles = false,
        },
        renderer = {
            indent_markers = { enable = false }
        }
    })
}
