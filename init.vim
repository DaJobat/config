call plug#begin('~/.config/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.5'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'ziglang/zig.vim'
  Plug 'ray-x/go.nvim'
call plug#end()

:lua << EOF
    local lspconfig = require('lspconfig')
    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('completion').on_attach()
    end
    local servers = {'zls'}
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
        }
    end

    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "zig", "vim", "vimdoc", "query" },
      sync_install = false,
      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
    require('go').setup();
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Enable completions as you type
let g:completion_enable_auto_popup = 1

nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

set number
set relativenumber
set expandtab
set shiftwidth=2
set ts=2
set autoindent
set cursorline
set showcmd   "shows command in bottom right
set wildmenu  "shows menu when you press tab 
set modelines=0
set nomodeline
set listchars+=space:_ "shows spaces as _ when :set list is enabled
"SEARCH
set incsearch "incremental search as characters are entered
set hlsearch  "highlight search matches
set showmatch "hightlight matching parens

"SPLIT
set splitbelow
set splitright
nnoremap <leader>vr :vertical resize 
nnoremap <leader>t :vertical terminal<CR>

let g:netrw_liststyle=3
let g:neocomplete#enable_at_startup = 1
let &l:path = '.,'

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

let g:loaded_python3_provider = 0
