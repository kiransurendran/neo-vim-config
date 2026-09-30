-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- :wvim.keymap.set("n", "<leader>sx", require("telescope").resume, { noremap = true, silent = true, desc = "Resume" })
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })
-- vim.keymap.set()
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- comment
