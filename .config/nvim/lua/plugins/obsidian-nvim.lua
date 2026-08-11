-- Obsidian navegacion entre notas
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
    note_id_func = function(title)
      if title ~= nil and title ~= "" then
        return title
      else
        local suffix = ""
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        return tostring(os.time()) .. "-" .. suffix
      end
    end,
  },
}
