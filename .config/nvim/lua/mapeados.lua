local mapeado = vim.keymap.set
local optsBar = { noremap = true, silent = true }

-- basicos
mapeado({ "n", "v" }, ";", ":")
mapeado("n", "<A-s>", vim.cmd.w, optsBar)
mapeado("n", "<A-q>", vim.cmd.q)

-- mapeado para borrar rápido en termux
mapeado("i", "<A-h>", "<BS>")


mapeado("i", "LL", "<Right>")

-- esc alternativo
mapeado("i", "fj", "<esc>")
mapeado("i", "jf", "<esc>")

-- buffers
mapeado('n', 'H', '<Cmd>bprevious<CR>', optsBar)
mapeado('n', 'L', '<Cmd>bnext<CR>', optsBar)
mapeado("n", "<A-w>", '<Cmd>bdelete<CR>')
mapeado('n', 'X', '<Cmd>b#<CR>', optsBar)

-- plugins
-- easy motion
vim.cmd [[let g:EasyMotion_do_mapping = 0]]
vim.cmd [[nmap s <plug>(easymotion-s2)]]

-- nvim telescrope filebrowser
mapeado("n", "<A-f>", ':Telescope file_browser path=%:p:h select_buffer=true<cr>', optsBar)
mapeado("n", "<leader>sf", ':Telescope file_browser path=%:p:h select_buffer=true<cr>', optsBar)

-- calendario vimwiki
mapeado("n", "<leader>cw", ':CalendarH<cr>', optsBar)

-- IconPicker
mapeado("i", "II", "<CMD>IconPickerInsert emoji nerd_font<cr>", optsBar)
