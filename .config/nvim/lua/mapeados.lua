local mapeado = vim.keymap.set
local optsBar = { noremap = true, silent = true }

-- basicos
mapeado({ "n", "v" }, ";", ":")
mapeado("n", "<C-s>", vim.cmd.w, optsBar)
mapeado("n", "<C-q>", vim.cmd.q)
mapeado("n", "<C-b>", ":DBUIToggle<cr>", optsBar)

mapeado("i", "LL", "<Right>")

-- ctrl+backspace: borrar palabra atrás (como en otros editores/terminales)
mapeado("i", "<C-BS>", "<C-w>", optsBar)
mapeado("i", "<C-h>", "<C-w>", optsBar)

-- esc alternativo
mapeado("i", "fj", "<esc>")
mapeado("i", "jf", "<esc>")

-- PHP: ->
vim.api.nvim_create_autocmd("FileType", {
    pattern = "php",
    callback = function(ev)
        vim.keymap.set("i", "--", function()
            vim.api.nvim_put({ "->" }, "c", false, true) -- inserta ->
            vim.schedule(function()
                require("cmp").complete()
            end)
        end, { buffer = ev.buf, silent = true })
    end,
})

-- checkbox
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function(args)
        vim.keymap.set('n', '<CR>', function()
            local line = vim.api.nvim_get_current_line()
            if line:match('%[ %]') then
                vim.api.nvim_set_current_line((line:gsub('%[ %]', '[x]', 1)))
            elseif line:match('%[[xX]%]') then
                vim.api.nvim_set_current_line((line:gsub('%[[xX]%]', '[ ]', 1)))
            else
                -- comportamiento normal de <CR>: baja a la primera columna no blanca de la siguiente línea
                vim.cmd('normal! +')
            end
        end, { buffer = args.buf, desc = 'Toggle checkbox / default <CR>' })
    end,
})


-- pundo y coma rápido
mapeado("n", "<leader>;", "$a;<esc>", optsBar)

-- buffers
mapeado("n", "H", "<Cmd>bprevious<CR>", optsBar)
mapeado("n", "L", "<Cmd>bnext<CR>", optsBar)
mapeado("n", "<C-w>", "<Cmd>Bdelete<CR>")
mapeado("n", "<C-q>", "<Cmd>qa<CR>")
mapeado("n", "X", "<Cmd>b#<CR>", optsBar)

-- bufferline (tabs)false
mapeado("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", optsBar)
mapeado("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", optsBar)

-- plugins
-- easy motion
-- vim.cmd([[let g:EasyMotion_do_mapping = 0]])
-- vim.cmd([[nmap s <plug>(easymotion-s2)]])

-- oil nvim
mapeado("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- leap
mapeado({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
mapeado('n', 'S', '<Plug>(leap-from-window)')

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

-- estilo vscode/zed
-- ctrl+shift+m -> errores/warnings (trouble)
mapeado("n", "<C-S-m>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", optsBar)
-- panel de archivos cambiados en git (fugitive)
-- ctrl+g / ctrl+shift+g no llegan distintos a la terminal, se usa <leader>is (ver which-key.lua)
