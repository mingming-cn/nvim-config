return {
  "garymjr/nvim-snippets",
  opts = {
    friendly_snippets = true,
  },
  dependencies = { "rafamadriz/friendly-snippets" },
  search_paths = { vim.fn.stdpath("config") .. "/snippets" },
}
