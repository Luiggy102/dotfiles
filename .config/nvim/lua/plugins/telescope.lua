local fb_actions = require "telescope".extensions.file_browser.actions
return {
    require('telescope').setup {
        defaults = {
            border = true,
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = 'top',
            },
            -- hidden = true,
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    ["<esc>"] = "close",

                },
            },
        },
        pickers = {
            -- find_files = { theme = "ivy", },
            -- oldfiles = { theme = "ivy", }
        },
        extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = { "png", "webp", "jpg", "jpeg" },
                -- find command (defaults to `fd`)
                find_cmd = "rg"
            },
            file_browser = {
                theme = "ivy",
                hidden = true,
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        -- your custom insert mode mappings
                        ["<esc>"] = false,
                    },
                    ["n"] = {
                        ["a"] = fb_actions.create,
                        -- your custom normal mode mappings
                    },
                },
            },
        },
    },
    require("telescope").load_extension('file_browser'),
    require('telescope').load_extension('media_files'),
}
