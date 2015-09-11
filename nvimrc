" ==================== Plugins =============================
call plug#begin('~/.nvim/plugged')

" Vim standard library
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
Plug 'tpope/vim-unimpaired'  " Lots of clever pairs of mappings

" Extra features
Plug 'tommcdo/vim-exchange'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/switch.vim' " Clever toggling with gs
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'rking/ag.vim'

" Ruby
Plug 'rhysd/vim-textobj-ruby'
Plug 'slim-template/vim-slim'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'jgdavey/vim-blockle' " Switch out for switch.vim?
Plug 'tpope/vim-rbenv'
Plug 't9md/vim-ruby-xmpfilter'
Plug 'thoughtbot/vim-rspec'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Trial
Plug 'svermeulen/vim-easyclip'
Plug 'justinmk/vim-sneak'
Plug 'kopischke/vim-fetch' " Handle line:column numbers in filenames

call plug#end()

runtime macros/matchit.vim

" ==================== theme ===============================
colorscheme hybrid_reverse

" No split separator char
set fillchars+=vert:\ " There's significant whitespace before this comment

" ==================== autocmds ============================
augroup settings
    " Make sure to not register the autocmds again when reloading nvimrc
    autocmd!

    " Reload .nvimrc on save
    autocmd BufWritePost nvimrc source $MYVIMRC

    " Don't insert comments with O
    autocmd FileType * setlocal formatoptions-=o

    " Trim whitespace on save
    autocmd BufWritePre * :Trim

    " Relative numbers in command mode, and normal in insert mode
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
augroup END

" ==================== Trim whitespace ====================
" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead * match ExtraWhitespace /^\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

function! TrimWhitespace()
    let l:save_cursor = getpos(".")
    " Remove trailing whitespace at the end of lines
    silent! execute ':%s/\s\+$//'
    " Remove trailing newlines at the end of file
    silent! execute ':%s/\($\n\s*\)\+\%$//'
    call setpos('.', l:save_cursor)
endfunction

command! Trim execute ':call TrimWhitespace()'

" ==================== Settings ============================
syntax on

set backspace=indent,eol,start " Make backspace work as expected

" Default indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set shiftround

set clipboard=unnamed " Yank to system clipboard
set autoread          " Reload files automatically
set wildmenu          " Show list of commands when tabbing
set nojoinspaces      " Join lines containing punctuation correctly

set hlsearch
set incsearch
set ignorecase
set smartcase " Ignore case if all lowercase
set lazyredraw " Don't redraw until macro has finished running

set nowrap
set number
set relativenumber
set synmaxcol=512 " Turn of syntax for absurdly long lines (makes opening huge json-files quick)
set iskeyword+=?,!

" Don't need it
set nobackup
set noswapfile

" Persistent undo
set undodir=~/.nvim/undo
set undofile

" Enable per project nvimrcs
set exrc
set secure

" Fix escape lag
set ttimeout
set ttimeoutlen=1

" Don't wait so long to complete a sequence
set timeoutlen=500

" Statusline
set laststatus=2
set statusline=%F
set statusline+=\ (%{fugitive#head(8)})
set statusline+=\ %y

" Load shell aliases
let $BASH_ENV = "~/.aliases"

" Escape in terminal mode
tnoremap <Esc> <c-\><c-n>
tnoremap <S-Esc> <Esc>

" ==================== Key mappings ========================
let mapleader=","

" U for normal redo is much more natural
nnoremap U <C-r>

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

" Save with C-s
nmap <C-s> :write<cr>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

" Run the q macro instead of stupid Ex-mode
nmap Q @q

" Split line on comma
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
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" NERDTree-style netrw
let g:netrw_liststyle=3

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
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump = '<Nop>'
let g:AutoPairsShortcutToggle = '<Nop>'

" Sneak
nmap <leader>f <Plug>Sneak_s
nmap <leader>F <Plug>Sneak_S
xmap <leader>f <Plug>Sneak_s
xmap <leader>F <Plug>Sneak_S
omap <leader>f <Plug>Sneak_s
omap <leader>F <Plug>Sneak_S

" Syntax highlighting for Lasp
autocmd BufNewFile,BufRead *.lasp setlocal ft=clojure
