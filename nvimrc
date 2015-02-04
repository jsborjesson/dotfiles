" ==================== Plugins =============================
call plug#begin('~/.nvim/plugged')

Plug 'junegunn/vim-easy-align'

call plug#end()

" ==================== reload nvimrc =======================
" Reload .nvimrc on save
augroup reload_vimrc
    " make sure to not register the autocmd again when reloading
    autocmd!
    autocmd BufWritePost nvimrc source $MYVIMRC
augroup END

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

set nonumber

" ==================== Key mappings ========================
let mapleader=","

" go to last file
nmap <leader><leader> <C-^>

" U for normal redo is much more natural
nnoremap U <C-r>

" Can't think of when I would ever want a normal C-c
nmap <C-c> <Esc>

" Y yanks to the end of the line, entire line is still available with yy
nnoremap Y y$

" K for split lines, as an opposite of J
nnoremap K i<CR><Esc>

" Insert newlines in normal mode
nmap <C-j> o<Esc>
nmap <C-k> O<Esc>

" Space to enter commands
map <space> :

" Quick clear search highlights
nmap <CR> :nohlsearch<cr>

" ==================== Plugin settings ====================
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
