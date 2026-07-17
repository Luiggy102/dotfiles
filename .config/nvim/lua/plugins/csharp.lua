-- soporte y debugging para C# (con omnisharp)
return {
    "iabdelkareem/csharp.nvim",
    dependencies = {
        "williamboman/mason.nvim", -- Required, automatically installs omnisharp
        "mfussenegger/nvim-dap",
        "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
    },
    config = function()
        require("csharp").setup({
            lsp = {
                omnisharp = {
                    cmd_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp",
                },
            },
        })
    end,
}
