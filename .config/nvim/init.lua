-- ajustes
require("ajustes")
-- mapeados
require("mapeados")
-- manejador de paquetes
require("lazy_nvim")
-- esquema de color
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme oxocarbon")
vim.cmd("colorscheme tokyonight")

-- para sintaxis angular
vim.cmd([[
  augroup AngularSyntax
    autocmd!
    autocmd BufRead,BufNewFile *.component.html
      \ syntax match AngularConditionalContent "@[a-zA-Z]\+\zs(\_.\{-\})" containedin=ALL |
      \ highlight AngularConditionalContent gui=italic guifg=DarkGray cterm=italic ctermfg=DarkGray |
      \ syntax match AngularKeyword "@[a-z]\+" |
      \ highlight AngularKeyword ctermfg=Blue guifg=#ca9ee6 |
      \ syntax match AngularInterpolation '{{[^}]*}}' |
      \ highlight AngularInterpolation gui=italic guifg=DarkGray cterm=italic |
  augroup END
]])
