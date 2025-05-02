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

lvim.builtin.which_key.mappings.D = {
  name = "Docker",
  D = {
    function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazydocker = Terminal:new {
        cmd = "lazydocker",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "none",
          width = 100000,
          height = 100000,
          zindex = 200,
        },
        on_open = function(_)
          vim.cmd "startinsert!"
        end,
        on_close = function(_) end,
        count = 99,
      }
      lazydocker:toggle()
    end,
    "Lazydocker"
  }
}

require("user.options")
