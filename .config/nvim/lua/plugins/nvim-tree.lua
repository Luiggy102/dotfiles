-- explorador de archivos en árbol lateral
local saved_width = 30

vim.api.nvim_create_autocmd("WinResized", {
    callback = function()
        for _, win in ipairs(vim.v.event.windows or {}) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "NvimTree" then
                saved_width = vim.api.nvim_win_get_width(win)
            end
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.api.nvim_win_set_width(0, saved_width)
    end,
})

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
