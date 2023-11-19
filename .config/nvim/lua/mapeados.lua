local mapeado = vim.keymap.set

-- basicos
mapeado({"n", "v"}, ";", ":")
-- mapeado("n", "<C-w>", vim.cmd.w)
-- mapeado("n", "<C-q>", vim.cmd.q)

mapeado("i", "LL", "<Right>")

-- plugins
--mapeado("i", "<C-i>", '<CMD>IconPickerInsert emoji nerd_font<cr>')
-- nvim bar
local optsBar = { noremap = true, silent = true }
mapeado('n', 'H', '<Cmd>BufferPrevious<CR>', optsBar)
mapeado('n', 'L', '<Cmd>BufferNext<CR>', optsBar)
mapeado('n', 'X>', '<Cmd>BufferClose<CR>', optsBar)
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
-- NvimTree
-- mapeado("n", "<C-n>", ':NvimTreeToggle<cr>',optsBar)
mapeado("n", "<C-n>", ':NvimTreeFindFileToggle<cr>',optsBar)
-- nvim telescrope filebrowser
mapeado("n", "<C-f>", ':Telescope file_browser path=%:p:h select_buffer=true<cr>',optsBar)
-- IconPicker
mapeado("i", "II", "<CMD>IconPickerInsert emoji nerd_font<cr>",optsBar)
