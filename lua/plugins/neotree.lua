return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "saifulapm/neotree-file-nesting-config", -- add plugin as dependency. no need any other config or setup call
  },
  opts = {
    filesystem = {
      commands = {
        copy_file_name = function(state) -- 复制当前文件的名称
          local node = state.tree:get_node()
          vim.fn.setreg("*", node.name, "c")
        end,
        system_open = function(state) -- 在系统文件浏览器中打开当前文件所在目录
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macOs: open file in default application in the background.
          vim.fn.jobstart({ "open", "-R", path }, { detach = true })

          -- Linux: open file in default application
          -- vim.fn.jobstart({ "xdg-open", path }, { detach = true })

          -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
          -- local p
          -- local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
          -- if lastSlashIndex then
          --   p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
          -- else
          --   p = path -- If no slash found, return original path
          -- end
          -- vim.cmd("silent !start explorer " .. p)
        end,
      },
      filtered_items = {
        never_show = {
          ".DS_Store",
        },
      },
      window = {
        mappings = {
          o = "system_open", -- 使用系统默认程序打开当前文件
          h = function(state) -- 折叠当前目录或上级目录
            local node = state.tree:get_node()
            if (node.type == "directory" or node:has_children()) and node:is_expanded() then
              state.commands.toggle_node(state)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
          end,
          l = function(state) -- 目录或文件有子项目的先展开，展开后目录选择第一个子项目，文件打开当前文件
            local node = state.tree:get_node()
            if node.type == "directory" or node:has_children() then
              if not node:is_expanded() then
                state.commands.toggle_node(state)
              elseif node.type == "file" and node:is_expanded() then
                require("neo-tree.sources.filesystem.commands").open(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
              end
            elseif node.type == "file" then
              require("neo-tree.sources.filesystem.commands").open(state)
            end
          end,
          ["Y"] = "copy_file_name", -- 复制文件名
          ["YY"] = { -- 复制文件完成路径
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
        },
      },
    },
  },
  config = function(_, opts)
    opts = vim.tbl_deep_extend("force", opts, {
      nesting_rules = require("neotree-file-nesting-config").nesting_rules,
    })
    require("neo-tree").setup(opts)
  end,
}
