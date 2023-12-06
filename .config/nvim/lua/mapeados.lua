local mapeado = vim.keymap.set

-- basicos
mapeado({"n", "v"}, ";", ":")
mapeado("n", "<C-s>", vim.cmd.w)
mapeado("n", "<C-q>", vim.cmd.q)

mapeado("i", "LL", "<Right>")

-- plugins
--mapeado("i", "<C-i>", '<CMD>IconPickerInsert emoji nerd_font<cr>')
-- nvim bar
local optsBar = { noremap = true, silent = true }
mapeado('n', 'H', '<Cmd>bprevious<CR>', optsBar)
mapeado('n', 'L', '<Cmd>bnext<CR>', optsBar)
mapeado('n', 'X', '<Cmd>bdelete<CR>', optsBar)

-- nvim telescrope filebrowser
mapeado("n", "<C-f>", ':Telescope file_browser path=%:p:h select_buffer=true<cr>',optsBar)
mapeado("n", "<leader>sf", ':Telescope file_browser path=%:p:h select_buffer=true<cr>',optsBar)

-- IconPicker
mapeado("i", "II", "<CMD>IconPickerInsert emoji nerd_font<cr>",optsBar)

-- capturas (sillicon.lua)
 vim.keymap.set('v', '<Leader>s', function() require('silicon').visualise_cmdline({ to_clip = true }) end)
-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set('v', '<Leader>bs', function() require('silicon').visualise_cmdline({ to_clip = true, show_buf = true }) end)
-- Generate visible portion of a buffer
vim.keymap.set('n', '<Leader>s', function() require('silicon').visualise_cmdline({ to_clip = true, visible = true }) end)
-- Generate current buffer line in normal mode
vim.keymap.set('n', '<Leader>s', function() require('silicon').visualise_api({ to_clip = true }) end)
