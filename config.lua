-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  }
}

lvim.plugins = {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end
  },
}

-- STATUSLINE (LUALINE) CONFIGURATION
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = {
    {
      "filename",
      path = 1, -- Show relative path
      symbols = {
        modified = "●", -- symbol for modified files
        readonly = "🔒", -- symbol for readonly files
        unnamed = "[No Name]",
      },
    },
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "location" },
}

require("user.options")
