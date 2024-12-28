return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion = {
      menu = {
        border = "single",
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "single" },
      },
    }
    -- opts.signature = { window = { border = "single" } }
  end,
}
