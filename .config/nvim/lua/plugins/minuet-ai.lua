-- aplicacion de la ia con neovim
return {
    "milanglacier/minuet-ai.nvim",
    opts = {
        provider = "gemini",
        provider_options = {
            gemini = {
                api_key = "GEMINI_API_KEY",
                model = "gemini-3.1-flash-lite",
            },
        },
        virtualtext = {
            auto_trigger_ft = {},
            keymap = {
                -- accept whole completion
                accept = '<A-l>',
                -- accept one line
                accept_line = '<A-a>',
                -- accept n lines (prompts for number)
                -- e.g. "A-z 2 CR" will accept 2 lines
                accept_n_lines = '<A-z>',
                -- Cycle to prev completion item, or manually invoke completion
                prev = '<A-[>',
                -- Cycle to next completion item, or manually invoke completion
                next = '<A-]>',
                dismiss = '<A-e>',
            },
        },
    },
    config = function(_, opts)
        require("minuet").setup(opts)

        vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
            pattern = { ".env", ".env.*", "*.env" },
            callback = function()
                vim.b.minuet_complete_enable = false
            end,
        })
    end,
}
