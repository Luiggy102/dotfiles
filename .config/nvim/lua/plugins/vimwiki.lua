return {
    "vimwiki/vimwiki",
    dependencies = {
        "mattn/calendar-vim",
    },
    init = function()
        -- desacartivar teclas
        -- vim.g.vimwiki_key_mappings = {
        -- 	all_maps = 0,
        -- 	global = 0,
        -- }
        vim.cmd([[
            let g:vimwiki_global_ext = 0
            let g:vimwiki_list = []
            let g:vimwiki_list += [{
              \ 'path': '~/vimwiki/wikis',
              \ 'path_html': '~/vimwiki/html'
              \ }]

            function! VimwikiLinkHandler(link)
              let link = a:link
              if link =~# '^vfile:'
                let link = link[1:]
              else
                return 0
              endif
              let link_infos = vimwiki#base#resolve_link(link)
              if link_infos.filename == ''
                echomsg 'Vimwiki Error: Unable to resolve link!'
                return 0
              else
                exe 'tabnew ' . fnameescape(link_infos.filename)
                return 1
              endif
            endfunction

        ]])
    end,
}
