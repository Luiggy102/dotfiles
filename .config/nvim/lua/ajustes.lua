-- ajustes de vim 
local opcion = vim.opt
local buffer = vim.b
local global = vim.g

vim.api.nvim_command('set fillchars=eob:\\ ')

-- esquema de color

vim.cmd[[let g:gruvbox_sign_column = 'none']]
-- Ajustes Globales
global.mapleader = " "
global.netrw_menu = 0

-- opciones (set)
-- opcion.spell = true
opcion.spelllang = { 'es_Es' }
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

-- ajustes buffer
buffer.fileenconding = "utf-8"
