set nocompatible

" ==================== Vundle ==============================
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'danro/rename.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'jgdavey/vim-blockle'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'itspriddle/vim-marked'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-fugitive'
Plugin 'slim-template/vim-slim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==================== Colors ==============================
syntax on
colorscheme jellybeans
set t_Co=256

" ==================== Plugin settings =====================
let NERDTreeQuitOnOpen=1
let g:NERDTreeWindowSize=40
let g:airline_powerline_fonts=1
let g:vim_markdown_folding_disabled=1
let g:multi_cursor_next_key='<C-d>'
let g:AutoPairsShortcutFastWrap='<Nop>'

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsEditSplit='vertical'

" Marked
let g:marked_app = "Marked"

" ==================== Promptline ==========================
" :PromptlineSnapshot! ./zsh_prompt
let g:promptline_theme='airline'
let g:promptline_preset = {
    \'a' : [ '%T' ],
    \'b' : [ promptline#slices#cwd() ],
    \'c' : [ promptline#slices#vcs_branch() ],
    \'z' : [ '$vim_mode' ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

" ==================== Key mappings ========================
let mapleader=","

" source vimrc
nmap <leader>v :w<cr>:so ~/.vimrc<cr>

" unmaps
map Q <Nop>
map K <Nop>

" U for redo is much more natural
nnoremap U <C-r>

" Space to enter commands
map <space> :

" Quick clear search highlights
nmap <enter> :nohlsearch<cr>

" Increase/decrease numbers with ctrl-x/c
nnoremap <C-c> <C-a>

" ctrl-s for saving
nmap <C-s> :update<cr>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

" ,, to go to last file
nmap <leader><leader> <C-^>

nmap <leader>x :!

" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" split navkgation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <leader>s <C-w>w
nnoremap <silent> <leader>+ :vertical resize +10<cr>
nnoremap <silent> <leader>- :vertical resize -10<cr>

" save and rake
nmap <leader>r :w<cr>:! rake<cr>

" plugins
vmap <enter> <plug>(EasyAlign)
nmap <leader>m :NERDTree<cr>
nmap <leader>M :NERDTreeFind<cr>
nmap <leader>f <C-p>

" git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" Open with pry
nmap <leader>p :!pry -r ./%<cr>

" Seeing is believing
nmap <F5> <Plug>(seeing-is-believing-run)
xmap <F5> <Plug>(seeing-is-believing-run)
imap <F5> <Plug>(seeing-is-believing-run)

nmap <F4> <Plug>(seeing-is-believing-mark)
xmap <F4> <Plug>(seeing-is-believing-mark)
imap <F4> <Plug>(seeing-is-believing-mark)

" ==================== Config ==============================

set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
set title
set showcmd
set laststatus=2  " Always show status line
" set shellcmdflag=-ic " load the zshrc
set clipboard=unnamed " yank to system clipboard
set scrolloff=3
set history=1000
set hidden
set autoread " reload files automatically
set hlsearch " highlight search results

runtime macros/matchit.vim

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

" ==================== Ruby stuff ==========================

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" ==================== Line numbers ========================
set number
set relativenumber

" Relative numbers in command mode, and normal in insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" ==================== Searching ===========================
set incsearch
set ignorecase
set smartcase " ignore case if all lowercase
