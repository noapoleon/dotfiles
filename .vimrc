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

"	Plug 'vimsence/vimsence'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark " Setting dark mode

" vimsense
"let g:vimsence_client_id = '439476230543245312'
"let g:vimsence_small_text = 'Vim'
"let g:vimsence_small_image = 'vim'
"let g:vimsence_editing_details = 'Editing: {}'
"let g:vimsence_editing_state = 'Working on: {}'
"let g:vimsence_file_explorer_text = 'In NERDTree'
"let g:vimsence_file_explorer_details = 'Looking for files'
"let g:vimsence_custom_icons = {'filetype': 'iconname'}
