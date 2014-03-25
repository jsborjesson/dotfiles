" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/tComment'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'itspriddle/vim-marked'

let mapleader=","

" NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
let g:NERDTreeWindowSize=38
nnoremap <leader>p :NERDTree .<cr>

" aesthetics
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" airline
Bundle 'bling/vim-airline'
set laststatus=2  " Always show status line
let g:airline_powerline_fonts=1

" whitespace
Bundle 'bronson/vim-trailing-whitespace'
nmap <leader>fw :FixWhitespace<cr>

" multiple cursors - the best feature of sublime I can't live without
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

" git
Bundle 'tpope/vim-fugitive'
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" backup and swap in tmp, fallback to current dir
set backupdir=~/.tmp,.
set backupdir=~/.tmp,.

" Enable filetypes
syntax on
filetype on
filetype plugin indent on

" indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab

" line numbers
set number
set relativenumber

" searching
set incsearch
set ignorecase
set smartcase " ignore case if all underscore

" config
set nocompatible
set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
set title
set showcmd
nmap <space> :
map Q <Nop>
map K <Nop>
