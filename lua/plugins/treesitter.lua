return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "css",
        "go",
        "gomod",
        "gotmpl",
        "gosum",
        "gowork",
        "yaml",
        "json",
        "javascript",
        "tsx",
        "typescript",
        "sql",
        "csv",
      },
      auto_install = true,
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = { "ruby" },
      },
      -- indent = { enable = true, disable = { "ruby" } },
    },
    -- config = function(_, opts)
    --   vim.filetype.add({
    --     extension = {
    --       gotmpl = "gotmpl",
    --       gohtml = "gotmpl",
    --       gohtmltmpl = "gotmpl",
    --       gotxttmpl = "gotmpl",
    --       gotexttmpl = "gotmpl",
    --     },
    --   })
    --
    --   local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
    --   parser_configs["gotmpl"] = {
    --     filetype = "gotmpl",
    --     used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "gotxttmpl", "gohtml" },
    --   }
    --
    --   require("nvim-treesitter.install").prefer_git = true
    --   require("nvim-treesitter.configs").setup(opts)
    -- end,
  },
}
