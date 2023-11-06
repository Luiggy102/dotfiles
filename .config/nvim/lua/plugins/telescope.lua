return {
    require('telescope').setup {
        defaults = {
            border = false,
        },
        pickers = {
            find_files = { theme = "ivy", },
            oldfiles = { theme = "ivy", }
        },
    },
    require("telescope").load_extension("package_info")
}
