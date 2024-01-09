local wk = require("which-key")
return {
    wk.register({
        ["<leader>"] = {
            ------------ código -----------------------
            c = {
                name = "código  ",
                _ = { ":<cr>", "" },
                a = { ":Lspsaga code_action<cr>", "acción" },
                p = { ":Lspsaga peek_definition<cr>", "ver definición (float)" },
                h = {
                    name = "Jerarquia llamadas  ",
                    i = { ":Lspsaga incoming_calls<cr>", "entrante  " },
                    o = { ":Lspsaga outgoing_calls<cr>", "saliente  " },
                },
                f = { ":Lspsaga finder<cr>", "finder" },
                o = { ":Lspsaga outline<cr>", "abrir/cerrar outline" },
            },
            ------------ ir en código -----------------------
            n = {
                name = "siguiente",
                d = { ":Lspsaga diagnostic_jump_next<cr>", "diagnostico" },
                c = { ":Gitsigns next_hunk<cr>", "cambio" },
            },
            p = {
                name = "anterior",
                d = { ":Lspsaga diagnostic_jump_prev<cr>", "diagnostico" },
                c = { ":Gitsigns prev_hunk<cr>", "cambio" },
            },
            ------------ navegación de archivos -----------------------
            a = {
                name = "archivos  ",
                f = { ":Telescope find_files<cr>", "buscar archivo" },
                h = { ":Telescope oldfiles<cr>", "buscar archivos recientes" },
                n = { ":enew<cr>", "nuevo archivo" },
                g = { ":Telescope live_grep<cr>", "buscar texto en archivos" },
                w = { ":w<cr>", "guardar" },
                q = { ":q<cr>", "salir" },
                Q = { ":wq<cr>", "guardar y salir" },
                s = { ":Telescope lsp_document_symbols<cr>", "Símbolos del archivo" },
                o = { function() vim.lsp.buf.format { async = true } end, "Formatear" },
                b = { ":Telescope file_browser path=%:p:h select_buffer=true<cr>", "navegador de archivos" },
            },
            ------------ Latex -----------------------
            l = {
                name = "latex  ",
                l = { ":VimtexCompile<cr>", "compilar" },
                e = { ":VimtexErrors<cr>", "errores" },
                o = { ":VimtexLog<cr>", "logs" },
                c = { ":VimtexTocToggle<cr>", "contenidos" },
                s = { ":VimtexStop<cr>", "detener" },
                v = { ":VimtexView<cr>", "ver documento" },
            },
            ------------ git -----------------------
            i = {
                name = "git  ",
                -- gitsigns --
                h = {
                    name = "hunk (cambios)",
                    p = { ":Gitsigns prev_hunk<cr>", "cambio anterior" },
                    n = { ":Gitsigns next_hunk<cr>", "siguiente cambio" },
                    v = { ":Gitsigns preview_hunk<cr>", "previsualizar cambio" },
                    r = { ":Gitsigns reset_hunk<cr>", "revertir cambio" },
                },
                b = { ":Gitsigns blame_line<cr>", "ver quien realizó cambio en esa línea" },
                -- vim fugitive --
                s = { ":G status<cr>", "status" },
                o = { ":G log<cr>", "log" },
                d = { ":G diff<cr>", "diff" },
                a = { ":G add .<cr>", "add (todo)" },
                e = { ":G restore --staged .<cr>", "restore (todo)" },
                c = { ":G commit<cr>", "commit" },
                l = { ":G pull origin main<cr>", "pull (origin/maim)" },
                p = { ":G push origin main<cr>", "push (origin/main)" },
            },
            ------------ ejecutar -----------------------
            r = {
                name = "ejecutar código  ",
                n = { ":!node %<cr>", "NodeJS" },
                t = { ":!ts-node %<cr>", "TypeScript" },
                r = { ":!Rscript %<cr>", "R" },
                l = { ":!lua %<cr>", "Lua" },
                c = { ':w<CR>:!g++ % -o "$(basename -s .cpp %)"<CR>:term {./"$(basename -s .cpp %)"}<cr>', "C++" },
                p = { ":w<cr>:term {python3 %}<cr>", "Python" },
                x = { ":VimtexCompile", "Compilar Latex" },
                o = { ":w<cr>:!go run %<cr>", "golang" }
            },
            ------------ acceso rápido -----------------------
            h = { ":Telescope oldfiles<cr>", "historial archivos  " },
            f = { ":Telescope find_files<cr>", "historial archivos  " },
            t = { ":Telescope colorscheme<cr>", "esquema de color  " },
        },
    }),
}
