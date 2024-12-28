-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- auto select Python venv for python project when possible
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*.py",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then
      require("venv-selector").retrieve_from_cache()
    end
  end,
  once = true,
})

-- Temperally disable autoformat when saving trigered by AutoSave plugin,
-- AutoFormant can still be done by manual saving (C-s)
local group = vim.api.nvim_create_augroup("autosave", {})
vim.api.nvim_create_autocmd("User", {
  desc = "Disable autoformat before auto saving",
  pattern = "AutoSaveWritePre",
  group = group,
  callback = function()
    vim.b[0].autoformat = false
  end,
})
vim.api.nvim_create_autocmd("User", {
  desc = "Enable autoformat after auto saving",
  pattern = "AutoSaveWritePost",
  group = group,
  -- callback = function(opts)
  callback = function()
    vim.b[0].autoformat = true
    -- if opts.data.saved_buffer ~= nil then
    --   local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
    --   print("AutoSave: saved " .. filename .. " at " .. vim.fn.strftime("%H:%M:%S"))
    -- end
  end,
})
