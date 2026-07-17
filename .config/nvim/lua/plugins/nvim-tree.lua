return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        filters = {
            enable = true,
            dotfiles = false,
        },
        git = {
            enable = true,
        },
        renderer = {
            -- root_folder_label = true,
            -- root_folder_label = ":~:s?$?/..?",
            root_folder_label = ":~:s?.*/??",
            -- root_folder_label = vim.fn.getcwd():match("([^/\\]+)/*$"),
            indent_markers = {
                enable = true,
            },
        },
        view = {
            side = "right",
            width = 30,
        },
        diagnostics = {
            enable = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
}
