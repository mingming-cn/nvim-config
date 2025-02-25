return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
      term_colors = true,
      integrations = {
        notify = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
    config = function()
      require("catppuccin").setup({
        flavour = "latte",
        color_overrides = {
          latte = {
            rosewater = "#cc7983",
            flamingo = "#bb5d60",
            pink = "#d54597",
            mauve = "#a65fd5",
            red = "#b7242f",
            maroon = "#db3e68",
            peach = "#e46f2a",
            yellow = "#bc8705",
            green = "#1a8e32",
            teal = "#00a390",
            sky = "#089ec0",
            sapphire = "#0ea0a0",
            blue = "#017bca",
            lavender = "#8584f7",
            text = "#444444",
            subtext1 = "#555555",
            subtext0 = "#666666",
            overlay2 = "#777777",
            overlay1 = "#888888",
            overlay0 = "#999999",
            surface2 = "#aaaaaa",
            surface1 = "#e6e9ef",
            surface0 = "#cccccc",
            base = "#ffffff",
            mantle = "#eeeeee",
            crust = "#dddddd",
          },
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
}
