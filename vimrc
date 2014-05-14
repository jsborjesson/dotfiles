set nocompatible              " be iMproved, required

" ==================== Vundle ====================
" loads all the plugins specified in the plugins.vim file
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

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

" ==================== Config ====================

set ttimeoutlen=1 " fixes delay on escape without breaking arrowkeys like noesckeys
set backspace=indent,eol,start " make backspace work as expected
set title
set showcmd
set laststatus=2  " Always show status line
set backupdir=~/.tmp,.
set directory=~/.tmp,.

" load the zshrc
set shellcmdflag=-ic

" yank to system clipboard
set clipboard=unnamed

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
set smartcase " ignore case if all lowercase

" ==================== Mappings ====================

" remaps
map Q <Nop>
map K <Nop>
nmap <space> :
map <space> :

" leader commands

let mapleader=","

" navigation
nmap <leader>p <C-p>
nnoremap <leader>m :NERDTree<cr>
nnoremap <leader>M :NERDTreeFind<cr>
nmap <leader><leader> <C-^>
nmap <leader>w :w<cr>
nmap <leader>x :wq<cr>
nmap <leader>c :!

" split navkgation
nmap <leader>s <C-w>w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>fw :FixWhitespace<cr>
vmap <enter> <plug>(EasyAlign)
nmap <leader>t :! rake test<cr>

" git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>
