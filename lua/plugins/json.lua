return {
  "VPavliashvili/json-nvim",
  ft = "json",
  config = function()
    vim.keymap.set("n", "<leader>jff", "<cmd>JsonFormatFile<cr>")
    vim.keymap.set("n", "<leader>jmf", "<cmd>JsonMinifyFile<cr>")
    vim.keymap.set("v", "<leader>jfs", ":JsonFormatSelection<cr>")
    vim.keymap.set("v", "<leader>jms", ":JsonMinifySelection<cr>")
  end,
}
