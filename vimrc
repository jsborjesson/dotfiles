" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on " required

" Bundles
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'

" make backspace work as expected
set backspace=indent,eol,start

set laststatus=2  " Always show status line

" indentation
set expandtab
set autoindent
set smartindent

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

let mapleader=","

