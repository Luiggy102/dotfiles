-- muestra cambios de git en el margen (hunks, blame)
return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 300,
            virt_text_pos = "eol",
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r)
                vim.keymap.set(mode, l, r, { buffer = bufnr })
            end

            -- click izquierdo en el gutter/margen -> preview del hunk
            map("n", "<LeftMouse>", function()
                vim.cmd("exec 'normal! \\<LeftMouse>'")
                gs.preview_hunk()
            end)

            -- click derecho en el gutter -> revertir el hunk
            map("n", "<RightMouse>", function()
                vim.cmd("exec 'normal! \\<LeftMouse>'")
                gs.reset_hunk()
            end)

            map("n", "]c", gs.next_hunk)
            map("n", "[c", gs.prev_hunk)
            map("n", "<leader>hp", gs.preview_hunk)
            map("n", "<leader>hr", gs.reset_hunk)
            map("n", "<leader>hs", gs.stage_hunk)
            map("n", "<leader>hu", gs.undo_stage_hunk)
        end,
    },
}
