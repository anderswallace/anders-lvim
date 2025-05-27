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
      show_modified_status = true,
      symbols = {
        modified = "[+]",
        readonly = "[-]",
        unnamed = "[No Name]",
        newfile = "[New]"
      },
    },
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = { "location" },
}
