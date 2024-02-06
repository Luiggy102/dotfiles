return {
    require('nvim-tmux-navigation').setup {
        keybindings = {
            left = "<A-h>",
            down = "<A-j>",
            up = "<A-k>",
            right = "<A-l>",
            -- last_active = "<C-\\>",
            next = "<A-Space>",
        }
    }
}
