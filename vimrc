" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle handle vundle
Plugin 'gmarik/vundle'

" Misc plugins
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'

let mapleader=","

" snippets
Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NERDTree
Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
let g:NERDTreeWindowSize=38
" show the current file on open
nnoremap <leader>p :NERDTree<cr>

" aesthetics
Plugin 'nanotech/jellybeans.vim'
colorscheme jellybeans

" airline
Plugin 'bling/vim-airline'
set laststatus=2  " Always show status line
let g:airline_powerline_fonts=1

" promptline
Plugin 'edkolev/promptline.vim'
let g:promptline_theme='airline'
let g:promptline_preset = {
    \'a' : [ '%T' ],
    \'b' : [ promptline#slices#user() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'x' : [ '$vim_mode' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'itspriddle/vim-marked'
let g:vim_markdown_folding_disabled=1

" whitespace
Plugin 'bronson/vim-trailing-whitespace'
nmap <leader>fw :FixWhitespace<cr>

" multiple cursors - the best feature of sublime I can't live without
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

" git
Plugin 'tpope/vim-fugitive'
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
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

" ruby
" TODO: move this to a ~/.vim/after/ftplugin/ruby.vim?
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" load the correct env in :! commands (use rvm ruby)
set shellcmdflag=-ic

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
