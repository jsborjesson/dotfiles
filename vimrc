set nocompatible              " be iMproved, required

" ==================== Vundle ==============================
" loads all the plugins specified in the plugins.vim file
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" ==================== Colors ==============================
syntax on
colorscheme jellybeans
set t_Co=256

let NERDTreeQuitOnOpen=1
let g:NERDTreeWindowSize=40
let g:airline_powerline_fonts=1
let g:vim_markdown_folding_disabled=1
let g:multi_cursor_next_key='<C-d>'

" :PromptlineSnapshot! ./zsh_prompt
let g:promptline_theme='airline'
let g:promptline_preset = {
    \'a' : [ '%T' ],
    \'b' : [ promptline#slices#cwd() ],
    \'c' : [ promptline#slices#vcs_branch() ],
    \'z' : [ '$vim_mode' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" Ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" ==================== Key mappings ========================
let mapleader=","
source ~/.vim/mappings.vim

" ==================== Config ==============================

set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
set title
set showcmd
set laststatus=2  " Always show status line
set shellcmdflag=-ic " load the zshrc
set clipboard=unnamed " yank to system clipboard


" ==================== Backup and swap =====================

set nobackup
set noswapfile

" ==================== Indentaion ==========================

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab


" ==================== Line numbers ========================

set number
set relativenumber


" ==================== Searching ===========================

set incsearch
set ignorecase
set smartcase " ignore case if all lowercase
