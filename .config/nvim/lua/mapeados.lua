local mapeado = vim.keymap.set

-- basicos
mapeado({"n", "v"}, ";", ":")
mapeado("n", "<C-w>", vim.cmd.w)
mapeado("n", "<C-q>", vim.cmd.q)
mapeado("n", "<leader>w", vim.cmd.w)
mapeado("n", "<leader>wq", ":wq<cr>")
mapeado("n", "<leader>q", vim.cmd.q)

mapeado("n", "<C-n>", ':NvimTreeToggle<cr>')
-- nvim bar
local optsBar = { noremap = true, silent = true }
mapeado('n', 'H', '<Cmd>BufferPrevious<CR>', optsBar)
mapeado('n', 'L', '<Cmd>BufferNext<CR>', optsBar)
mapeado('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', optsBar)
mapeado('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', optsBar)
mapeado('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', optsBar)
mapeado('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', optsBar)
mapeado('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', optsBar)
mapeado('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', optsBar)
mapeado('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', optsBar)
mapeado('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', optsBar)
mapeado('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', optsBar)
mapeado('n', '<C-0>', '<Cmd>BufferLast<CR>', optsBar)
mapeado('n', '<C-p>', '<Cmd>BufferPick<CR>', optsBar)
mapeado('n', '<C-w>', '<Cmd>BufferClose<CR>', optsBar)
