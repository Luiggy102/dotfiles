-- comandos de git dentro de nvim (status, diff, commit, etc)
return {
    "tpope/vim-fugitive",
    config = function()
        -- fix: en buffers de fugitive (:Git status), <C-w> debe cerrar el split
        -- completo en vez de solo borrar el buffer (que deja el split en blanco)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "fugitive",
            callback = function(args)
                vim.keymap.set("n", "<C-w>", "<Cmd>close<CR>", { buffer = args.buf, silent = true })
            end,
        })
    end,
}
