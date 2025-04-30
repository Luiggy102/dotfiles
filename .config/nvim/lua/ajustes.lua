-- ajustes de vim
local opcion = vim.opt
local buffer = vim.b
local global = vim.g

vim.api.nvim_command("set fillchars=eob:\\ ")

-- spell en archivos tipo
vim.cmd([[autocmd BufRead,BufNewFile *.wiki setlocal spell]])
vim.cmd([[autocmd BufRead,BufNewFile *.tex setlocal spell]])
vim.cmd([[autocmd BufRead,BufNewFile *.md setlocal spell]])
vim.cmd([[autocmd BufRead,BufNewFile *.txt setlocal spell]])

vim.cmd([[autocmd BufRead,BufNewFile *.dbout setlocal nonumber norelativenumber]])

-- vim.cmd([[nnoremap <LeftMouse> <LeftMouse>i]]) -- inset en el click del mouse

-- generar diario VimWiki
vim.cmd([[
let g:vimwiki_list = [{'auto_diary_index': 1}]
]])

-- formatear el código en el guardado
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Ajustes Globales
global.mapleader = " "
global.maplocalleader = ","
global.netrw_menu = 0

-- opciones (set)
-- opcion.spell = true
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
opcion.spelllang = "es"
opcion.completeopt = { "menuone", "noselect" }
opcion.showmode = false -- no mostrar el modo
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
-- opcion.cursorlineopt = "number"
opcion.numberwidth = 4
opcion.signcolumn = "yes" -- columna gruvbox
opcion.wrap = true
opcion.linebreak = true
opcion.scrolloff = 8
opcion.sidescrolloff = 8
-- colomna guia
-- opcion.colorcolumn = "66"

-- opciones fold
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]] -- como en el demo

-- vim.o.foldcolumn = "auto:9" -- para ver los nested folds
vim.o.foldcolumn = "0" -- para borrar

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- ajustes buffer
buffer.fileenconding = "utf-8"
