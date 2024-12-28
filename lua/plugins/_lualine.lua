if true then
  return {}
end
local Util = require("lazyvim.util")
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_c = {
      Util.lualine.root_dir(),
      "diagnostics",
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      "filename",
      -- "require'lspsaga.symbol.winbar'.get_bar({show_file=false})",
    }
  end,
}
