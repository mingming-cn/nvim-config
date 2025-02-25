-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- 设置高亮列的背景色，用于代码长度提示
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#fafafa" })

-- disable persistence for certain directories
local persistenceGroup = vim.api.nvim_create_augroup("Persistence", { clear = true })
local home = vim.fn.expand("~")
local disabled_dirs = {
  home,
  home .. "/Downloads",
  "/private/tmp",
}

local cwd = vim.fn.getcwd()

-- 自动恢复上次打开的文件，自动显示 neo-tree
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = persistenceGroup,
  callback = function()
    for _, path in pairs(disabled_dirs) do
      if path == cwd then
        require("persistence").stop()
        return
      end
    end
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      require("persistence").load()
      require("neo-tree.command").execute({ action = "show" })
    else
      require("persistence").stop()
    end
  end,
  nested = true,
})

local dirName = string.match(cwd, ".+/(.+)")

-- 自动把当前文件夹名称设置为 tmux 窗口标题
if vim.fn.exists("$TMUX") == 1 then
  -- vim.fn.jobstart("tmux rename-window " .. dirName, { cwd = cwd })
else
  -- 如果是在 kitty 终端中，自动设置终端的标题
  if vim.fn.exists("$KITTY_WINDOW_ID") == 1 then
    local kitty_listen_on = vim.fn.getenv("KITTY_LISTEN_ON")

    vim.fn.jobstart("kitten @ --to " .. kitty_listen_on .. " set-tab-title " .. dirName, { cwd = cwd })

    vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
      callback = function()
        vim.fn.jobstart("kitten @ --to " .. kitty_listen_on .. " set-tab-title ''", { cwd = cwd, detach = true })
      end,
    })
  end
end

-- Set GIT_EDITOR to use nvr if Neovim and nvr are available
if vim.fn.has("nvim") == 1 and vim.fn.executable("nvr") == 1 then
  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
