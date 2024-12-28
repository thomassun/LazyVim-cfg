-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- Resize window using <ctrl> arrow keys
map({ "n", "t" }, "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "t" }, "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "t" }, "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "t" }, "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps cheatsheet" })
map({ "n", "t" }, "<M-=>", "<C-w>=", { desc = "Make all windows equally high and wide" })
map("n", "-", "<cmd>foldclose<cr>", { desc = "Close code fold" })
map("n", "+", "<cmd>foldopen<cr>", { desc = "Open code fold" })
map("n", "<C-u>", "<C-u>zz", { desc = "page up, keep cursor of the center of the screen" })
map("n", "<C-d>", "<C-d>zz", { desc = "page up, keep cursor of the center of the screen" })
map("n", "<leader>P", '"_dP', { desc = "Replace and forget the content to be replaced" })

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- vim way: ; goes to the direction you were moving.
-- local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
