-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.colorcolumn = "120"
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#fafafa" })
-- opt.hidden = false
opt.relativenumber = false
opt.spelllang = { "en", "cjk" }
-- opt.mousemodel = "extend"

vim.g.snacks_animate = false

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
-- vim.g.lazyvim_ruby_lsp = "solargraph"
-- vim.g.lazyvim_ruby_formatter = "rubocop"

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
