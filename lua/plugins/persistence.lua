return {
  "folke/persistence.nvim",
  lazy = true,
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  config = function()
    require("persistence").setup({
      dir = vim.fn.expand(vim.fn.stdpath("cache") .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
      pre_save = nil,
    })
  end,
}
