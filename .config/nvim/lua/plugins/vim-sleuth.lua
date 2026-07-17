-- detecta automáticamente shiftwidth/expandtab por archivo
return {
    "tpope/vim-sleuth",
    event = { "BufReadPost", "BufNewFile" },
}
