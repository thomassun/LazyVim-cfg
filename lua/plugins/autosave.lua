local ft = { "*.rs", "*.py", "*.toml" }
return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    debounce_delay = 500,
    -- execution_message = {
    --   message = function() -- message to print on save
    --     return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    --   end,
    --   dim = 0.18, -- dim the color of `message`
    --   cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    -- },
    trigger_events = {
      defer_save = {
        { "InsertLeave", pattern = ft },
        { "TextChanged", pattern = ft },
      },
      immediate_save = {
        { "BufLeave", pattern = ft },
        { "FocusLost", pattern = ft },
      },
    },
    condition = function(buf)
      local fn = vim.fn
      -- Just auto-save NORMAL buffer
      if fn.getbufvar(buf, "&buftype") ~= "" then
        return false
      end
      return true
    end,
  },
}
