" My own config stuff
" Load this with source e.g.: source ~/mycfg/.vimrc in parent vimrc.
"disable arrow keys - Break the habit!
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"Set my leader to be space bar
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

"Set colorscheme to monokai, requires github.com/sickill/vim-monokai to be in .vim/colors directory.
syntax enable
colorscheme monokai
set number
set expandtab
set shiftwidth=2
set ts=2
set autoindent
set nocompatible
set cursorline
set showcmd   "shows command in bottom right
set wildmenu  "shows menu when you press tab 

"Horrible stuff so cygwin shows cursor as a block in normal mode.
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"SEARCH
set incsearch "incremental search as characters are entered
set hlsearch  "highlight search matches
set showmatch "hightlight matching parens
nnoremap <leader><space> :nohlsearch<CR> 
" ^clear search by double tapping space

"SPLIT
set splitbelow
set splitright
nnoremap <leader>vr :vertical resize 

let g:netrw_liststyle=3

