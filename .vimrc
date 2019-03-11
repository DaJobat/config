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
set number
set relativenumber
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

"default encryption of files with :X to blowfish2
set cm=blowfish2

"SPLIT
set splitbelow
set splitright
nnoremap <leader>vr :vertical resize 

let g:netrw_liststyle=3

function CryptoRand(max)
  return system("cat /dev/random | tr -dc '0-9' | fold -w 8 | head -n 1") % a:max
endfunction

function GenPass(website)
  let wordlist = readfile("/usr/share/dict/words")
  call filter(wordlist, "v:val !~ ''''" )
  let passlist = []
  for i in [0,1,2,3,4]
    let x = CryptoRand(len(wordlist))
    let y = get(wordlist,x)
    call add(passlist, y)
  endfor

  let p = join(passlist, "")
  let pl2 = []
  for c in split(p, '\zs')
    let x = CryptoRand(5)
    if x ==? 1
      call add(pl2, c)
    elseif x ==? 2
      call add(pl2, CryptoRand(9))
    elseif x ==? 3
      call add(pl2, toupper(c))
    endif
  endfor
  let p = join(pl2, "")
  execute "normal i " . a:website . "\n" . l:p
endfunction

command  -nargs=1 Pwd call GenPass(<args>)
