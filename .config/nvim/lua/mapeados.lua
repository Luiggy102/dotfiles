local mapeado = vim.keymap.set
local optsBar = { noremap = true, silent = true }

-- basicos
mapeado({ "n", "v" }, ";", ":")
mapeado("n", "<C-s>", vim.cmd.w, optsBar)
mapeado("n", "<C-q>", vim.cmd.q)
mapeado("n", "<C-b>", ":DBUIToggle<cr>", optsBar)

mapeado("i", "LL", "<Right>")

-- esc alternativo
mapeado("i", "fj", "<esc>")
mapeado("i", "jf", "<esc>")

-- pundo y coma rápido
mapeado("n", "<leader>;", "$a;<esc>", optsBar)

-- buffers
mapeado("n", "H", "<Cmd>bprevious<CR>", optsBar)
mapeado("n", "L", "<Cmd>bnext<CR>", optsBar)
mapeado("n", "<C-w>", "<Cmd>bdelete<CR>")
mapeado("n", "X", "<Cmd>b#<CR>", optsBar)

-- plugins
-- easy motion
-- vim.cmd([[let g:EasyMotion_do_mapping = 0]])
-- vim.cmd([[nmap s <plug>(easymotion-s2)]])

-- oil nvim
mapeado("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nvim telescrope filebrowser
mapeado("n", "<C-f>", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", optsBar)
-- mapeado("n", "<C-n>", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", optsBar)
mapeado("n", "<leader>sf", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", optsBar)

-- nvimtree
-- para abrir en el path de buffer
-- mapeado(
-- 	"n",
-- 	"<C-n>",
-- 	":lua require('nvim-tree.api').tree.toggle({path = vim.fn.expand('%:p:h'),find_file=true})<cr>",
-- 	optsBar
-- )
-- para abirlo normal
mapeado("n", "<C-n>", ":NvimTreeToggle<cr>", optsBar)

-- calendario vimwiki
mapeado("n", "<leader>wc", ":CalendarH<cr>", optsBar)

--lsp doc symbols
mapeado("n", "<leader>ds", ":Telescope lsp_document_symbols<cr>", optsBar)

-- IconPicker
mapeado("i", "II", "<CMD>IconPickerInsert emoji nerd_font<cr>", optsBar)
