-- Noa Custom Config
--vim.cmd("set noexpandtab")
vim.opt.expandtab	= false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Changing Leader
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

-- Disable mouse mode
vim.opt.mouse = ""
