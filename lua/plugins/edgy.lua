return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.keys = {
      -- increase width
      ["<M-Right>"] = function(win)
        win:resize("width", 2)
      end,
      -- decrease width
      ["<M-Left>"] = function(win)
        win:resize("width", -2)
      end,
      -- increase height
      ["<M-Up>"] = function(win)
        win:resize("height", 2)
      end,
      -- decrease height
      ["<M-Down>"] = function(win)
        win:resize("height", -2)
      end,
    }
  end,
}
