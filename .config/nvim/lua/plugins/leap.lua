return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    init = function()
        vim.cmd([[highlight LeapBackdrop guifg=#777777]])
        require("leap").create_default_mappings()
    end,
    opts = {},
}
