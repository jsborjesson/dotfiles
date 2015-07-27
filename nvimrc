" ==================== Plugins =============================
call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-repeat'      " Make . work with plugins
Plug 'tpope/vim-commentary'  " Comment lines with gc
Plug 'tpope/vim-surround'    " Change surrounding quotes, tags...
Plug 'tpope/vim-fugitive'    " Git helpers
Plug 'tpope/vim-eunuch'      " Unix helpers such as :Move, :Rename and :SudoWrite
Plug 'tpope/vim-abolish'     " Case insensitive search and camel/snake/mixed-switching
Plug 'tpope/vim-sleuth'      " Set indentation settings automatically
Plug 'tpope/vim-rsi'         " Readline key-mappings for insert and command mode
Plug 'tpope/vim-vinegar'     " Better netrw filebrowser
Plug 'tpope/vim-endwise'     " Put in end automatically
Plug 'tpope/vim-jdaddy'      " gqaj to format json, also aj and ij text-objects
Plug 'tpope/vim-speeddating' " Makes C-a and C-x work for dates
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sjl/badwolf'
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/switch.vim' " Clever toggling with gs
Plug 'bronson/vim-trailing-whitespace'
Plug 'kana/vim-textobj-user'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'

" Ruby
Plug 'rhysd/vim-textobj-ruby'
Plug 'slim-template/vim-slim'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'jgdavey/vim-blockle'
Plug 'tpope/vim-rbenv'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'thoughtbot/vim-rspec'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'

" Trial
Plug 'rizzatti/dash.vim'
Plug 'SirVer/ultisnips'

call plug#end()

runtime macros/matchit.vim

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

" Default indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

set clipboard=unnamed " Yank to system clipboard
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
nnoremap U <C-r>

" Can't think of when I would ever want a normal C-c
map <C-c> <Esc>

" Y yanks to the end of the line, entire line is still available with yy
nmap Y y$

" / searches for selection in visual mode
vmap / "sy/<C-r>s<Enter>

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


" Save with C-s
nmap <C-s> :update<cr>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

nmap <leader>d :s/,/,\r/g<cr><C-l>

" ==================== Plugin settings ====================

" Commentary
let g:commentary_map_backslash=0

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Fugitive
nmap <Leader>ga :Gwrite<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <Leader>gp :Gpush<cr>
nmap <Leader>gb :Gbrowse<cr>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Switch
let g:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['to', 'not_to'],
    \   ['first', 'last'],
    \ ]

" GitGutter
let g:gitgutter_sign_removed_first_line = "_^"

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}
let g:AutoPairsMultilineClose = 0

" Syntax highlighting for Lasp
autocmd BufNewFile,BufRead *.lasp setlocal syntax=clojure
