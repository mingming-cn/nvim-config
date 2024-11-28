-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- load the session for the current directory
-- vim.keymap.set("n", "<leader>qs", function()
--   require("persistence").load()
-- end, { desc = "Load session curr dir" })

-- select a session to load
-- vim.keymap.set("n", "<leader>qS", function()
--   require("persistence").select()
-- end, { desc = "Select a session to load" })

-- load the last session
-- vim.keymap.set("n", "<leader>ql", function()
--   require("persistence").load({ last = true })
-- end, { desc = "Load the last session" })

-- stop Persistence => session won't be saved on exit
-- vim.keymap.set("n", "<leader>qd", function()
--   require("persistence").stop()
-- end, { desc = "Stop Persistence " })

-- translation
vim.keymap.set("n", "<leader>tw", "<cmd>:TranslateW<cr>", { desc = "Display translation in a window" })
vim.keymap.set("v", "<leader>tw", "<cmd>:TranslateW<cr>", { desc = "Display translation in a window" })
