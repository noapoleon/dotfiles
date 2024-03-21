----------------
-- noa config --
----------------
-- tabs
vim.opt.expandtab	= false
vim.opt.tabstop		= 4
vim.opt.shiftwidth	= 4
vim.opt.softtabstop	= 4

-- mics
vim.g.mapleader	= " "
vim.opt.wrap	= false

-- highlights / whitespace
vim.opt.colorcolumn	= table.concat(vim.fn.range(81,999), ",")
vim.opt.cursorline	= true
vim.opt.listchars	= { tab = ">-", trail = "~" }
vim.opt.list		= true
vim.cmd("au BufRead,BufNewFile *.template,*.tpp  set filetype=cpp")

-- numbers
vim.opt.nu	= true
vim.opt.rnu	= true

-- 42 header
vim.g.user42	= "nlegrand"
vim.g.mail42	= "nlegrand@student.42.fr"
-- other variables
--vim.g.gruvbox_contrast_dark = "hard"
----------------
-- noa config --
----------------

-- Clones lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--{ "sainnhe/gruvbox-material" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ...},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"42Paris/42header"},
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "java", "javascript", "cpp", "c", "html", "css", "bash", "dockerfile", "make", "gitignore", "json", "php", "python", "regex", "ruby", "rust", "vim", "vimdoc", "xml", "yaml"},
	highlight = { enable = true },
	indent = { enable = false },
})

-- Colorschemes
vim.opt.background = "dark"
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
