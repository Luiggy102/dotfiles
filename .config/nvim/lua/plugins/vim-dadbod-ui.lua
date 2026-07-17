-- interfaz gráfica para dadbod (conexiones y consultas a bd)
local saved_width = 50

vim.api.nvim_create_autocmd("WinResized", {
    callback = function()
        for _, win in ipairs(vim.v.event.windows or {}) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft:match("^dbui") or ft == "dbout" then
                saved_width = vim.api.nvim_win_get_width(win)
            end
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dbui",
    callback = function()
        vim.api.nvim_win_set_width(0, saved_width)
    end,
})

return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod",                     lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        vim.g.dbs = {
            { name = 'BDGUIA',    url = vim.env.DBUI_URL_DB1 },
            { name = 'BDFACTURA', url = vim.env.DBUI_URL_DB2 },
        }
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_win_position = "right"
        vim.g.db_ui_winwidth = 50
        vim.g.db_adapter_mssql = "sqlserver"
    end,
}
