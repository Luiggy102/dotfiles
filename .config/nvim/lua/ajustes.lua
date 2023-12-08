-- ajustes de vim
local opcion = vim.opt
local buffer = vim.b
local global = vim.g

vim.api.nvim_command('set fillchars=eob:\\ ')
-- spell en archivos tipo
vim.cmd [[autocmd BufRead,BufNewFile *.wiki setlocal spell]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex setlocal spell]]
-- indentado en archivos tipo
-- R (cambiar indentado y activar 'Nvim-R' automáticamente)
vim.cmd [[ autocmd BufRead,BufNewFile *.r setlocal expandtab | setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal autoindent | setlocal smartindent | let R_auto_start = 1 | let R_objbr_auto_start = 1 ]]

-- formatear el código en el guardado
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Ajustes Globales
global.mapleader = " "
global.netrw_menu = 0
-- pluggins
global['vimtex_view_method'] = 'zathura'
global['vimtex_compiler_method'] = 'tectonic'
global['vimtex_syntax_enabled'] = 0

-- opciones (set)
-- opcion.spell = true
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
opcion.spelllang = { 'es' }
opcion.completeopt = { "menuone", "noselect" }
opcion.showmode = true
opcion.clipboard = "unnamedplus"
opcion.shiftwidth = 4
opcion.tabstop = 4
opcion.softtabstop = 4
opcion.expandtab = true
opcion.number = true
-- opcion.relativenumber = true
opcion.ignorecase = true
opcion.termguicolors = true
opcion.wrap = false
opcion.splitright = true
opcion.filetype = "on"
opcion.autoindent = true
opcion.mouse = "a"
opcion.smartcase = true
opcion.smartindent = true
opcion.swapfile = false
-- opcion.undofile = true
opcion.updatetime = 300
opcion.expandtab = true
opcion.cursorcolumn = false
opcion.cursorline = true
opcion.cursorlineopt = "number"
opcion.numberwidth = 4
opcion.signcolumn = "yes" -- columna gruvbox
opcion.wrap = true
opcion.linebreak = true
opcion.scrolloff = 8
opcion.sidescrolloff = 8
-- colomna guia
-- opcion.colorcolumn = "66"

-- ajustes buffer
buffer.fileenconding = "utf-8"

-- neovide
vim.g.neovide_cursor_vfx_mode = "torpedo"
vim.o.guifont = "JetBrains Mono:h15"
vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_trail_size = 0.8
