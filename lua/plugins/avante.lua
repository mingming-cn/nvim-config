if true then
  return {}
end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "azure",
    -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
    -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
    -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
    auto_suggestions_provider = "azure",
    cursor_applying_provider = "azure",
    azure = {
      endpoint = "https://dmlandcurosrjapaneast.openai.azure.com", -- example: "https://<your-resource-name>.openai.azure.com"
      deployment = "gpt-4o", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
      api_version = "2024-06-01",
      timeout = 10000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
    },
    ---Specify the behaviour of avante.nvim
    ---1. auto_focus_sidebar              : Whether to automatically focus the sidebar when opening avante.nvim. Default to true.
    ---2. auto_suggestions = false, -- Whether to enable auto suggestions. Default to false.
    ---3. auto_apply_diff_after_generation: Whether to automatically apply diff after LLM response.
    ---                                     This would simulate similar behaviour to cursor. Default to false.
    ---4. auto_set_keymaps                : Whether to automatically set the keymap for the current line. Default to true.
    ---                                     Note that avante will safely set these keymap. See https://github.com/yetone/avante.nvim/wiki#keymaps-and-api-i-guess for more details.
    ---5. auto_set_highlight_group        : Whether to automatically set the highlight group for the current line. Default to true.
    ---6. jump_result_buffer_on_finish = false, -- Whether to automatically jump to the result buffer after generation
    ---7. support_paste_from_clipboard    : Whether to support pasting image from clipboard. This will be determined automatically based whether img-clip is available or not.
    ---8. minimize_diff                   : Whether to remove unchanged lines when applying a code block
    ---9. enable_token_counting           : Whether to enable token counting. Default to true.
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions = true, -- Experimental stage
      auto_suggestions_respect_ignore = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      jump_result_buffer_on_finish = false,
      support_paste_from_clipboard = false,
      minimize_diff = true,
      enable_token_counting = true,
      enable_cursor_planning_mode = true,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
