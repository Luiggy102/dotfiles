function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<A-\><A-n>]], opts)
    vim.keymap.set('t', 'jk', [[<A-\><A-n>]], opts)
    vim.keymap.set('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<A-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

return {
    require("toggleterm").setup {
        open_mapping = [[<A-\>]],
        -- direction = 'float',
        -- direction = 'horizontal',
        -- direction = 'vertical',
        -- size = 60,
    },
}
