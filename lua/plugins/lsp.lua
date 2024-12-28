return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      --   inlay_hints = { enabled = true },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- local cmp = require("cmp")
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "<leader>ca", false }
      -- keys[#keys + 1] = { "]d", false }
      -- keys[#keys + 1] = { "[d", false }
      keys[#keys + 1] = { "<a-n>", false }
      keys[#keys + 1] = { "<a-p>", false }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      outline = {
        layout = "float",
        keys = {
          jump = "<CR>",
        },
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = true,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = {
      { "gD", mode = "n", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition in floating window" },
      { "<leader>ca", mode = "n", "<cmd>Lspsaga code_action<CR>", desc = "Lspsaga code action" },
      -- { "[d", mode = "n", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic with quick fix" },
      { "<M-p>", mode = "n", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic with quick fix" },
      -- { "]d", mode = "n", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic with quick fix" },
      { "<M-n>", mode = "n", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic with quick fix" },
      { "<leader>cM", mode = "n", "<cmd>Lspsaga finder<CR>", desc = "Lspsaga code finder" },
      { "<leader>cO", mode = "n", "<cmd>Lspsaga outline<CR>", desc = "Lspsaga code outline" },
    },
  },
}
