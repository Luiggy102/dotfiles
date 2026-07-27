-- cliente REST para archivos .http (compatible con REST Client de VS Code)
return {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
        { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Kulala: Send request" },
        { "<leader>rp", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Kulala: Toggle view" },
        { "<leader>rr", "<cmd>lua require('kulala').replay()<cr>", desc = "Kulala: Replay last request" },
    },
    opts = {
        global_keymaps = true,
    },
}
