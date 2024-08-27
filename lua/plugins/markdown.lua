return {
  {
    "MeanderingProgrammer/markdown.nvim",
    -- enabled = false,
    opts = {
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = false,
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- The result is left padded with spaces to hide any additional '#'
        icons = {},
        -- Added to the sign column if enabled
        -- The 'level' is used to index into the array using a cycle
        signs = { "󰫎 " },
        -- Width of the heading background:
        --  block: width of the heading text
        --  full: full width of the window
        width = "block",
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading icon and extends through the entire line
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = false,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full: normal + language
        style = "full",
        -- Amount of padding to add to the left of code blocks
        left_pad = 0,
        -- Amount of padding to add to the right of code blocks when width is 'block'
        right_pad = 0,
        -- Width of the code block background:
        --  block: width of the code block
        --  full: full width of the window
        width = "full",
        -- Determins how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin: when lines are empty overlay the above & below icons
        border = "thick",
        -- Used above code blocks for thin border
        above = "▄",
        -- Used below code blocks for thin border
        below = "▀",
        -- Highlight for code blocks & inline code
        highlight = "",
        highlight_inline = "",
      },
    },
  },
  {
    -- Install markdown preview, use npx if available.
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable("npx") then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd([[Lazy load markdown-preview.nvim]])
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable("npx") then
        vim.g.mkdp_filetypes = { "markdown" }
      end
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
  },
  {
    "dhruvasagar/vim-table-mode",
    config = function() end,
  },
}
