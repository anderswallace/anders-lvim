lvim.colorscheme = "nordic"


lvim.plugins = {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark"
      lvim.transparent_window = false

      require("nordic").setup({
        transparent = {
          enabled = false,
        },
        on_highlights = function(highlights, colors)
          highlights.Normal = { fg = colors.fg, bg = colors.bg }
        end,
      })

      vim.cmd("colorscheme nordic")
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  }
}


require("user.options")
require("user.lualine")
require("user.lazydocker")
require("user.formatters")
