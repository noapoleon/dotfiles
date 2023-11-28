set hlsearch
set incsearch
set smartcase
set ignorecase

set cursorline
"hi CursorLine cterm=bold ctermbg=233
let &cc=join(range(81, 999), ",")
hi ColorColumn cterm=bold ctermbg=233 ctermfg=red

syntax on
set noexpandtab
set cindent
set tabstop=4
set shiftwidth=4
set nu rnu
set nowrap

set confirm
set scrolloff=10
"set splitright
"set splitbelow

set listchars=tab:>-,trail:~
set list
"hi SpecialKey ctermfg=235

let g:user42 = 'nlegrand'
let g:mail42 = 'nlegrand@student.42.fr'

call plug#begin()
	Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark " Setting dark mode
