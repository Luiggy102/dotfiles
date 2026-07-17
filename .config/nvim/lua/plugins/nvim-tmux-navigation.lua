-- navegación entre paneles de tmux y ventanas de nvim
return {
    "alexghergh/nvim-tmux-navigation",
    opts = {
        keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
            -- last_active = "<C-\\>",
            next = "<C-Space>",
        },
    },
}
