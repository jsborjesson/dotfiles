" ==================== Plugins =============================
call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-repeat'     " Make . work with plugins
Plug 'tpope/vim-commentary' " Comment lines with gc
Plug 'tpope/vim-surround'   " Change surrounding quotes, tags...
Plug 'tpope/vim-fugitive'   " Git helpers
Plug 'tpope/vim-eunuch'     " Unix helpers such as :Move, :Rename and :SudoWrite
Plug 'tpope/vim-abolish'    " Case insensitive search and camel/snake/mixed-switching
Plug 'tpope/vim-sleuth'     " Set indentation settings automatically
Plug 'tpope/vim-rsi'        " Readline key-mappings for insert and command mode
Plug 'tpope/vim-vinegar'    " Better netrw filebrowser
Plug 'tpope/vim-endwise'    " Put in end automatically
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sjl/badwolf'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/switch.vim' " Clever toggling with gs
Plug 'bronson/vim-trailing-whitespace'
Plug 'jgdavey/vim-blockle'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'rking/ag.vim'

call plug#end()

runtime macros/matchit.vim

" ==================== autocmds ============================
augroup settings
    " Make sure to not register the autocmds again when reloading nvimrc
    autocmd!

    " Reload .nvimrc on save
    autocmd BufWritePost nvimrc source $MYVIMRC

    " Don't insert comments with O
    autocmd FileType * setlocal formatoptions-=o

    " Trim whitespace on save
    autocmd BufWritePre * :FixWhitespace
augroup END

" ==================== theme ===============================
colorscheme badwolf

" ==================== Settings ============================
syntax on

set backspace=indent,eol,start " Make backspace work as expected

set clipboard=unnamed " Yank to system clipboard
set autoread          " Reload files automatically
set wildmenu          " Show list of commands when tabbing
set nojoinspaces      " Join lines containing punctuation correctly

set hlsearch
set incsearch
set ignorecase
set smartcase " Ignore case if all lowercase

set number

set synmaxcol=512 " Turn of syntax for absurdely long lines (makes opening huge json-files quick)

" Don't need it
set nobackup
set noswapfile

" Persistent undo
set undodir=~/.nvim/undo
set undofile

" Load shell aliases
let $BASH_ENV = "~/.aliases"

" ==================== Key mappings ========================
let mapleader=","

" U for normal redo is much more natural
map U <C-r>

" Can't think of when I would ever want a normal C-c
map <C-c> <Esc>

" Y yanks to the end of the line, entire line is still available with yy
map Y y$

" Navigate wrapped lines easier
nmap j gj
nmap k gk

" Space to enter commands
map <space> :

" Quick clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Go to last file
nmap <leader><leader> <C-^>

" Insert newlines in normal mode
nmap <C-j> o<Esc>
nmap <C-k> O<Esc>

" ==================== Plugin settings ====================
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>
