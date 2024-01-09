local mapeado = vim.keymap.set
local optsBar = { noremap = true, silent = true }

-- basicos
mapeado({ "n", "v" }, ";", ":")
mapeado("n", "<C-s>", vim.cmd.w, optsBar)
mapeado("n", "<C-q>", vim.cmd.q)

mapeado("i", "LL", "<Right>")

-- buffers
mapeado('n', 'H', '<Cmd>bprevious<CR>', optsBar)
mapeado('n', 'L', '<Cmd>bnext<CR>', optsBar)
mapeado("n", "<C-w>", '<Cmd>bdelete<CR>')
mapeado('n', 'X', '<Cmd>b#<CR>', optsBar)

-- plugins
-- easy motion
vim.cmd [[let g:EasyMotion_do_mapping = 0]]
vim.cmd [[nmap s <plug>(easymotion-s2)]]

-- nvim telescrope filebrowser
mapeado("n", "<C-f>", ':Telescope file_browser path=%:p:h select_buffer=true<cr>', optsBar)
mapeado("n", "<leader>sf", ':Telescope file_browser path=%:p:h select_buffer=true<cr>', optsBar)

-- calendario vimwiki
mapeado("n", "<leader>cw", ':CalendarH<cr>', optsBar)

-- IconPicker
mapeado("i", "II", "<CMD>IconPickerInsert emoji nerd_font<cr>", optsBar)

-- capturas (sillicon.lua)
vim.keymap.set('v', '<Leader>s', function() require('silicon').visualise_cmdline({ to_clip = true }) end)

-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set('v', '<Leader>bs',
    function() require('silicon').visualise_cmdline({ to_clip = true, show_buf = true }) end)
-- Generate visible portion of a buffer
vim.keymap.set('n', '<Leader>s', function() require('silicon').visualise_cmdline({ to_clip = true, visible = true }) end)
-- Generate current buffer line in normal mode
vim.keymap.set('n', '<Leader>s', function() require('silicon').visualise_api({ to_clip = true }) end)
