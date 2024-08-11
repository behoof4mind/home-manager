return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      keywords = { bold = true },
      functions = { bold = true },
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.bg_statusline = colors.none -- To check if its working try something like "#ff00ff" instead of colors.none
    end,
  },
}
