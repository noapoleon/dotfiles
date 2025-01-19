-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Noa custom indent settings
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
-- Color Column
vim.opt.colorcolumn = "80,100,120"

-- fix: opening directory sometimes wrong one
vim.g.root_spec = { "cwd" }

-- fix: annoying autoformat
vim.g.autoformat = false
