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
Plug 'tpope/vim-jdaddy'     " gqaj to format json, also aj and ij text-objects
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sjl/badwolf'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/switch.vim' " Clever toggling with gs
Plug 'bronson/vim-trailing-whitespace'
Plug 'kana/vim-textobj-user'
Plug 'rking/ag.vim'

" Ruby
Plug 'rhysd/vim-textobj-ruby'
Plug 'slim-template/vim-slim'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'jgdavey/vim-blockle'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'

" Trial
Plug 'svermeulen/vim-easyclip'
Plug 'thoughtbot/vim-rspec'
Plug 'rizzatti/dash.vim'

call plug#end()

runtime macros/matchit.vim
" TODO:
" reorganize nvimrc

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

set clipboard=        " Yank to system clipboard
set autoread          " Reload files automatically
set wildmenu          " Show list of commands when tabbing
set nojoinspaces      " Join lines containing punctuation correctly

set hlsearch
set incsearch
set ignorecase
set smartcase " Ignore case if all lowercase

set nowrap
set number
set synmaxcol=512 " Turn of syntax for absurdly long lines (makes opening huge json-files quick)
set iskeyword+=?,! " For better method autocomplete in Ruby

" Don't need it
set nobackup
set noswapfile

" Persistent undo
set undodir=~/.nvim/undo
set undofile

" Enable per project nvimrcs
set exrc
set secure

set laststatus=2
set statusline=%F
set statusline+=\ (%{fugitive#head(8)})
set statusline+=\ %y

" Load shell aliases
let $BASH_ENV = "~/.aliases"

" ==================== Key mappings ========================
let mapleader=","

" U for normal redo is much more natural
map U <C-r>

" Can't think of when I would ever want a normal C-c
map <C-c> <Esc>

" Y yanks to the end of the line, entire line is still available with yy
nmap Y y$

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

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Fugitive
nmap <Leader>ga :Gwrite<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <Leader>gp :Gpush<cr>
nmap <Leader>gb :Gbrowse<cr>

" RSpec
let g:rspec_command = "!foreman run bundle exec rspec {spec}"
nmap <Leader>t :call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk

" EasyClip
let g:EasyClipUseCutDefaults = 0
nmap x  <Plug>MoveMotionPlug
xmap x  <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug
nmap X  <Plug>MoveMotionEndOfLinePlug

let g:EasyClipUsePasteToggleDefaults = 0
nmap <M-p> <plug>EasyClipSwapPasteForward
nmap <M-n> <plug>EasyClipSwapPasteBackwards

let g:EasyClipAutoFormat = 1

" Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Switch
let g:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['to', 'not_to']
    \ ]

" Seeing Is Believing
nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
imap <buffer> <F5> <Plug>(seeing-is-believing-run)

nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
