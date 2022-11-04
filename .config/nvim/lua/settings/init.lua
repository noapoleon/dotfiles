vim.opt.expandtab = false
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true;

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.fileencoding = 'utf-8'
-- vim.opt.termguicolors = true -- might have something to do with themes

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.listchars = {tab = '>-', trail = '~'}
vim.opt.list = true
vim.opt.colorcolumn = {81}

-- colors highlight
vim.api.nvim_set_hl(0, 'ColorColumn', {bold=true, ctermbg=0}) -- bold not working
vim.api.nvim_set_hl(0, 'CursorLine', {bold=true, ctermbg=0}) -- bold not working
vim.api.nvim_set_hl(0, 'Whitespace', {cterm=none, ctermfg=235})

vim.opt.hidden = true

-- 42Header
vim.g.user42 = 'nlegrand'
vim.g.mail42 = 'nlegrand@student.42.fr'
