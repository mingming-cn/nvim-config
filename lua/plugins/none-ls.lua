return {
  "nvimtools/none-ls.nvim",
  optional = true,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "gomodifytags", "impl" } },
    },
  },
  opts = function(_, opts)
    local nls = require("null-ls")
    -- 修改参数，把 project 放在 std 后，保持与 goland 顺序一致
    local goimports_reviser = nls.builtins.formatting.goimports_reviser.with({
      generator_opts = {
        command = "goimports-reviser",
        args = { "-set-alias", "--imports-order", "std,project,general,company", "$FILENAME" },
        to_temp_file = true,
        prepend_extra_args = true,
      },
    })
    -- 修改参数，把每行的长度修改为 120 个字符
    local golines = nls.builtins.formatting.golines.with({
      generator_opts = {
        command = "golines",
        args = { "-m", "120" },
        to_stdin = true,
      },
    })

    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.goimports,
      nls.builtins.formatting.gofumpt,
      nls.builtins.code_actions.impl,
      nls.builtins.code_actions.gomodifytags,
      goimports_reviser,
      golines,
    })

    -- for i, v in ipairs(opts.sources) do
    --   if v == nls.builtins.diagnostics.markdownlint_cli2 then
    --     table.remove(opts.sources, i)
    --   end
    -- end
  end,
}
