-- Obsidian navegacion entre notas
return {
"epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.opt.conceallevel = 2
  end,
  opts = {
workspaces = {
      {
        name = "cerebro",
        path = "~/Documents/cerebro",
      },
  },
  }
}
