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
Plug 'rhysd/vim-textobj-ruby',                     { 'for': 'ruby'    }
Plug 'slim-template/vim-slim',                     { 'for': 'ruby'    }
Plug 'hwartig/vim-seeing-is-believing',            { 'for': 'ruby'    }
Plug 'jgdavey/vim-blockle',                        { 'for': 'ruby'    }
Plug 'tpope/vim-rbenv',                            { 'for': 'ruby'    }
Plug 't9md/vim-ruby-xmpfilter',                    { 'for': 'ruby'    }
Plug 'thoughtbot/vim-rspec',                       { 'for': 'ruby'    }

" Clojure
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

" Trial
Plug 'justinmk/vim-sneak'
Plug 'kopischke/vim-fetch' " Handle line:column numbers in filenames
Plug 'tpope/vim-liquid'

call plug#end()

runtime macros/matchit.vim

syntax on

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
    " autocmd BufWritePre * :Trim

    " Relative numbers in command mode, and normal in insert mode
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
augroup END

" ==================== Trim whitespace =====================
" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead * match ExtraWhitespace /^\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

function! TrimWhitespace()
    let l:save_cursor = getpos('.')

    " Remove trailing whitespace at the end of lines
    silent! execute ':%s/\s\+$//'

    " Remove trailing newlines at the end of file
    silent! execute ':%s/\($\n\s*\)\+\%$//'

    call setpos('.', l:save_cursor)
endfunction

command! Trim execute ':call TrimWhitespace()'


" ==================== Break line on =======================
function! BreakLineOn()
    call inputsave()
    let split = input('Break line on: ')
    call inputrestore()

    silent! execute ':s/' . split . '/' . split . '\r/g'
endfunction

" ==================== Settings ============================
set hidden
set gdefault
set clipboard=unnamed " Yank to system clipboard
set nojoinspaces      " Join lines containing punctuation correctly
set lazyredraw        " Don't redraw until macro has finished running
set nowrap
set number
set relativenumber
set synmaxcol=512     " Turn of syntax for absurdly long lines (makes opening huge json-files quick)
set listchars+=tab:»·

" Default indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set shiftround

" More natural split destinations
set splitright
set splitbelow

set ignorecase
set smartcase " Ignore case if all lowercase

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
set statusline=\ %F                               " Path
set statusline+=\ %y                              " Filetype
set statusline+=\ (%{fugitive#head(8)})           " Git branch
set statusline+=%=                                " Right alingn after this
set statusline+=\ %c,%l/%L\ -                     " col,line/total lines
set statusline+=\ %{strftime('%a\ %d\ %b\ %R')}\  " Clock

" Load shell aliases
let $BASH_ENV = "~/.aliases"

" Increase scrollback in terminal mode
let g:terminal_scrollback_buffer_size=10000

" Thin cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ==================== Key mappings ========================
" U for normal redo is much more natural
nnoremap U <C-R>

" Run the q macro instead of stupid Ex-mode
nnoremap Q @q

" Run macro over multiple lines
vnoremap Q :normal @q<CR>

" Y yanks to the end of the line, entire line is still available with yy
nnoremap Y y$

" C-J already behaves like enter, this makes it work for bindings to <CR> too
imap <C-J> <CR>

" Make * and # search for selection in visual mode
vnoremap * "xy/\V<C-R>=escape(@x, '/\')<CR><CR>
vnoremap # "xy?\V<C-R>=escape(@x, '?\')<CR><CR>

" Navigate wrapped lines easier
nnoremap j gj
nnoremap k gk

" Fast skipping
nnoremap <C-J> 10gj
nnoremap <C-K> 10gk

" Search command history with C-p and C-n
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Better and more consistent &
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Bring in path to folder of current file in command-line with %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let mapleader=","

" Space to enter command-line mode
noremap <Space> :

" Quick clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR>:diffupdate<CR><C-L>

" Go to last file
nnoremap <Leader><Leader> <C-^>

" Save with C-s
nnoremap <C-S> :Trim<CR>:write<CR>
vmap <C-S> <Esc><C-S>gv
imap <C-S> <Esc><C-S>

" Break line on input
nnoremap <Leader>w :call BreakLineOn()<CR>

" Escape in terminal mode
tnoremap <Esc> <C-\><C-N>

" Black hole redirection
nnoremap <Leader>d "_

" Quick paste last yank
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" Count matches from last search
nnoremap <Leader>c :%s///n<CR>
vnoremap <Leader>c :s///n<CR>

" ==================== Plugin settings ====================

" Commentary
let g:commentary_map_backslash=0

" EasyAlign
vmap g<Space> <Plug>(EasyAlign)
nmap g<Space> <Plug>(EasyAlign)

" Fugitive
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gv :Gcommit -v<CR>
nnoremap <Leader>gf :Gwrite<CR>:Gcommit -v<CR>i
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gb :Gbrowse<CR>
vnoremap <Leader>gb :Gbrowse<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Switch
" TODO: map, noremap
let g:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['to', 'not_to'],
    \   ['first', 'last'],
    \ ]

" GitGutter
let g:gitgutter_sign_removed_first_line = "_^"

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutToggle = ''

" Sneak
nmap <Leader>f <Plug>Sneak_s
nmap <Leader>F <Plug>Sneak_S
xmap <Leader>f <Plug>Sneak_s
xmap <Leader>F <Plug>Sneak_S
omap <Leader>f <Plug>Sneak_s
omap <Leader>F <Plug>Sneak_S

" Syntax highlighting for Lasp
autocmd BufNewFile,BufRead *.lasp setlocal ft=clojure
