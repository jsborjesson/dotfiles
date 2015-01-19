set nocompatible

" ==================== Vundle ==============================
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Editing
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'

" Files and navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'slim-template/vim-slim'
Plugin 'itspriddle/vim-marked'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'

" Theme
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==================== vimrc ==============================
" Reload .vimrc on save
augroup reload_vimrc
    " make sure to not register the autocmd again when reloading
    autocmd!
    autocmd BufWritePost vimrc source $MYVIMRC
augroup END

" ==================== Colors ==============================
syntax on
colorscheme jellybeans
set t_Co=256

" ==================== Plugin settings =====================
" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeWindowSize=40

" AutoPairs
let g:AutoPairsShortcutFastWrap=''

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"
let g:UltiSnipsEditSplit="vertical"

" Misc
let g:airline_powerline_fonts=1
let g:rspec_command = "!foreman run bundle exec rspec {spec}"
let g:marked_app = "Marked"


" ==================== Key mappings ========================
let mapleader=","

" Manually source vimrc
nmap <leader>v :source $MYVIMRC<cr>

" Unmap Ex-mode and man-lookup
map Q <Nop>
map K <Nop>

" U for normal redo is much more natural
nnoremap U <C-r>

nmap <C-c> <Esc>

" Only go to last non-whitespace char
noremap $ g_

" Make Y work like all the other upper-case actions
nnoremap Y y$

" Space to enter commands
map <space> :

" Don't jump wrapped lines
nmap j gj
nmap k gk

" Emacs style forward/back in insert mode
imap <C-f> <right>
imap <C-b> <left>

" Quick clear search highlights
nmap <CR> :nohlsearch<cr>

" ctrl-s for saving
nmap <C-s> :update<cr>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

" ,, to go to last file
nmap <leader><leader> <C-^>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Insert newlines in normal mode
nmap <C-j> o<Esc>
nmap <C-k> O<Esc>

" Split navkgation
" nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-l> <C-w>l
nnoremap <silent> <leader>+ :vertical resize +10<cr>
nnoremap <silent> <leader>- :vertical resize -10<cr>

" Align selection
vmap <enter> <plug>(EasyAlign)

" Open NERDTree
nmap <leader>m :NERDTree<cr>
" Open NERDTree focusing on the current file
nmap <leader>M :NERDTreeFind<cr>

" Git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" RSpec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ==================== Config ==============================

set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
set title
" set shellcmdflag=-ic  " load the zshrc
set scrolloff=3
set history=1000
set hidden
set laststatus=2      " always show status line
set clipboard=unnamed " yank to system clipboard
set autoread          " reload files automatically
set wildmenu          " show list of commands when tabbing
set nojoinspaces      " join lines containing punctuation correctly
set cursorline        " highlight current line
set iskeyword-=_      " jump individual words in snake_case

" Trim trailing whitespace on save
autocmd BufWritePre * :FixWhitespace

runtime macros/matchit.vim

" ==================== Backup and swap =====================
" Don't need it
set nobackup
set noswapfile

" persistent-undo
set undodir=~/.vim/undo
set undofile

" ==================== Indentaion ==========================
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set shiftround " make >> indent to the correct level if cursor is between tab widths

" ==================== Ruby stuff ==========================

autocmd Filetype ruby setlocal ts=2 sw=2 sts=2

" ==================== Line numbers ========================
set number
set relativenumber

" Relative numbers in command mode, and normal in insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" ==================== Searching ===========================
set hlsearch  " highlight search results
set incsearch
set ignorecase
set smartcase " ignore case if all lowercase
