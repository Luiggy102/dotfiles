return {
    -- "ggandor/leap.nvim",
    "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    init = function()
        vim.cmd([[highlight LeapBackdrop guifg=#777777]])
    end,
    opts = {},
}
