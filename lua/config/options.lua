-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.wrap = true
vim.opt.winbar = "%=%m %f"
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.encoding = "utf-8"
vim.opt.visualbell = true
vim.opt.scrolloff = 5
-- vim.opt.fillchars = { eob = " " }
-- vim.opt.background = "dark"
vim.opt.list = false

vim.opt.laststatus = 3 -- for avante
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.opt.autoindent = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end
