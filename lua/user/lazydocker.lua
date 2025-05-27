-- Create the lazydocker terminal once, at the top-level scope
local Terminal = require("toggleterm.terminal").Terminal
local lazydocker = Terminal:new {
  cmd = "lazydocker",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "rounded",
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

lvim.builtin.which_key.mappings.d = {
  name = "Docker",
  d = {
    function()
      lazydocker:toggle()
    end,
    "Lazydocker"
  }
}
