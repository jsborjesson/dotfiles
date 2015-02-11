" ==================== Plugins =============================
call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-commentary' " Comment lines with gc
Plug 'tpope/vim-fugitive'   " Git helpers
Plug 'tpope/vim-eunuch'     " Unix helpers such as :Move and :SudoWrite
Plug 'tpope/vim-abolish'    " case insensitive search and camel/snake/mixed-switching
Plug 'tpope/vim-sleuth'     " set indentation settings automatically
Plug 'tpope/vim-rsi'        " Readline key-mappings for insert and command mode
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sjl/badwolf'

call plug#end()

" ==================== reload nvimrc =======================
" Reload .nvimrc on save
augroup reload_nvimrc
    " make sure to not register the autocmd again when reloading
    autocmd!
    autocmd BufWritePost nvimrc source $MYVIMRC
augroup END

" ==================== theme ===============================
colorscheme badwolf

" ==================== Settings ============================
syntax on

set backspace=indent,eol,start " make backspace work as expected

set clipboard=unnamed " yank to system clipboard
set autoread          " reload files automatically
set wildmenu          " show list of commands when tabbing
set nojoinspaces      " join lines containing punctuation correctly

set hlsearch
set incsearch
set ignorecase
set smartcase " ignore case if all lowercase

set number

" ==================== Key mappings ========================
let mapleader=","

" U for normal redo is much more natural
map U <C-r>

" Can't think of when I would ever want a normal C-c
map <C-c> <Esc>

" Y yanks to the end of the line, entire line is still available with yy
map Y y$

" Space to enter commands
map <space> :

" Quick clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" go to last file
nmap <leader><leader> <C-^>

" K for split lines, as an opposite of J
nnoremap K i<CR><Esc>

" Insert newlines in normal mode
nmap <C-j> o<Esc>
nmap <C-k> O<Esc>

" ==================== Plugin settings ====================
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
