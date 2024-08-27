return {
  {
    "ray-x/go.nvim",
    -- enabled = false,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        comment_placeholder = " ",
        diagnostic = {
          virtual_text = false,
        },
      })

      vim.cmd("autocmd FileType go nmap <Leader>Gta :GoAddTag ")
      vim.keymap.set("n", "<leader>Gtj", function()
        require("go.tags").add()
      end, { desc = "Add Json Tags" })

      vim.keymap.set("n", "<leader>Gtr", function()
        require("go.tags").rm()
      end, { desc = "Remove Tags" })
      vim.keymap.set("n", "<leader>Gtc", function()
        require("go.tags").clear()
      end, { desc = "Clear tags" })
      vim.keymap.set("n", "<leader>Gca", function()
        require("go.comment").gen()
      end, { desc = "Add comment" })
      vim.keymap.set("n", "<leader>Ggl", function()
        require("go.null_ls").golangci_lint()
      end, { desc = "Golangci lint" })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
