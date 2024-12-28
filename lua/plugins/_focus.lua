if true then
  return {}
end
return {
  {
    "nvim-focus/focus.nvim",
    version = "*",
    setup = function()
      require("focus").setup()
    end,
  },
}
