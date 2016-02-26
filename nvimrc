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
Plug 'kopischke/vim-fetch'   " Handle line:column numbers in filenames

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

" Rust
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Trial
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-liquid'
Plug 'freitass/todo.txt-vim'

call plug#end()

runtime macros/matchit.vim

syntax on

" ==================== Theme ===============================

" Make sure colors work in tmux
if exists('$TMUX')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Thin cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

colorscheme hybrid_reverse

" No split separator char
set fillchars+=vert:\  " There's significant whitespace before this comment

" ==================== autocmds ============================
augroup settings
    " Make sure to not register the autocmds again when reloading nvimrc
    autocmd!

    " Reload .nvimrc on save
    autocmd BufWritePost nvimrc source $MYVIMRC

    " Don't insert comments with O
    autocmd FileType * setlocal formatoptions-=o

    " Relative numbers in command mode, and normal in insert mode
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber

    " Automatically rebalance splits on resize
    autocmd VimResized * :wincmd =
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

command! TrimWhitespace execute ':call TrimWhitespace()'


" ==================== Break line on =======================
function! BreakLineOn()
    call inputsave()
    let split = input('Break line on: ')
    call inputrestore()

    silent! execute ':s/' . split . '/' . split . '\r/' . (&gdefault ? '' : 'g')
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
set diffopt+=vertical

" Default indentation settings
set tabstop=8
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
set statusline+=\ %c,%l/%L\                       " col,line/total lines

" Load shell aliases
let $BASH_ENV = "~/.alias"

" Increase scrollback in terminal mode
let g:terminal_scrollback_buffer_size=10000

" ==================== Vim++ mappings ======================
" This first section of mappings I categorize as either fixing or
" supercharging Vim's behaviour - it fixes flaws, makes standard commands
" better and fills holes in Vim's interface.
"
" Basically - anything I think should be standard Vim goes here:

" U for normal redo is much more natural
nnoremap U <C-R>

" Enable @@ usage over several lines in selection
xnoremap @@ :normal @@<CR>

" Repeat command over multiple lines
xnoremap . :normal .<CR>

" Y yanks to the end of the line, entire line is still available with yy
nnoremap Y y$

" Make * and # search for selection in visual mode
xnoremap * "xy/\V<C-R>=escape(@x, '/\')<CR><CR>
xnoremap # "xy?\V<C-R>=escape(@x, '?\')<CR><CR>

" Search command history with C-p and C-n
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Better and more consistent &
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" ==================== Key mappings ========================

" C-J already behaves like enter, this makes it work for bindings to <CR> too
" (C-M also mostly behaves like enter)
imap <C-J> <CR>
nmap <C-J> <CR>

" Navigate wrapped lines easier
nnoremap j gj
nnoremap k gk


" Shift-; to do the opposite of ; makes a lot of sense, and : now gets the
" prime real estate it deserves.
nnoremap : ,
nnoremap , :

" Run the q macro instead of stupid Ex-mode
nnoremap Q @q

" Run the q macro over multiple lines
xnoremap Q :normal @q<CR>

" Quick clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR>:diffupdate<CR><C-L>

" Save with C-s
nnoremap <C-S> :TrimWhitespace<CR>:write<CR>
vmap <C-S> <Esc><C-S>gv
imap <C-S> <Esc><C-S>

" Resize splits
nmap <C-A-k> :resize +10<CR>
nmap <C-A-j> :resize -10<CR>
nmap <C-A-l> :vertical resize +10<CR>
" This mapping doesn't work, <C-h> = BS
" nmap <C-A-h> :vertical resize -10<CR>
nmap <A-BS> :vertical resize -10<CR>

" Escape in terminal mode
tnoremap <Esc><Esc> <C-\><C-N>

" Bring in path to folder of current file in command-line with %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" ==================== Leader commands =====================
" Mappings that I haven't found a better key combination for yet.

let mapleader="\<Space>"
let maplocalleader="\<Space>"

" Manually reload nvimrc
nnoremap <Leader>r :source $MYVIMRC<CR>

" Go to last file
nnoremap <Leader><Leader> <C-^>

" Add missing J mappings that take motions
" To join a paragraph, normally you first have to select it by doing vipJ.
" ,J takes a motion so you can do ,Jip
nnoremap <Leader>J  :set operatorfunc=JoinOperator<CR>g@
nnoremap <Leader>gJ :set operatorfunc=GJoinOperator<CR>g@
func! JoinOperator(submode)
    '[,']join
endfunc
func! GJoinOperator(submode)
    '[,']join!
endfunc

" Highlight word but don't jump to the next match
nmap <Leader>* *``
nmap <Leader># #``
xmap <Leader>* *``
xmap <Leader># #``

" Break line on input
nnoremap <Leader>w :call BreakLineOn()<CR>

" Wrap until end of line in parenthesis
nmap <Leader>( ysg_)

" Black hole redirection
nnoremap <Leader>d "_

" Quick paste last yank
nnoremap <Leader>p "0p
xnoremap <Leader>p "0p

" Count matches from last search
nnoremap <Leader>c :%s///n<CR>
xnoremap <Leader>c :s///n<CR>

" Set 2 or 4 space indent
nnoremap <Leader>2 :set et sw=2<CR>
nnoremap <Leader>4 :set et sw=4<CR>


" ==================== Plugin settings ====================

" Ag
nnoremap <Leader>a :Ag<Space>

" Commentary
let g:commentary_map_backslash=0

" EasyAlign
vmap g<Space> <Plug>(EasyAlign)
nmap g<Space> <Plug>(EasyAlign)

" Support vim comments too
let g:easy_align_delimiters = { '"': { 'pattern': '"\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  } }

" Fugitive
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gv :Gcommit -v<CR>
nnoremap <Leader>gf :Gwrite<CR>:Gcommit -v<CR>i
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gb :Gbrowse<CR>
xnoremap <Leader>gb :Gbrowse<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager    = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed_first_line = "_^"
nmap <Leader>gh <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutToggle = ''

" Tmux interaction
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-m> :TmuxNavigatePrevious<cr>

nnoremap <silent> <C-f> :VtrSendLinesToRunner<CR>
xnoremap <silent> <C-f> :VtrSendLinesToRunner<CR>

" Sneak
nmap <Leader>f <Plug>Sneak_s
nmap <Leader>F <Plug>Sneak_S
xmap <Leader>f <Plug>Sneak_s
xmap <Leader>F <Plug>Sneak_S
omap <Leader>f <Plug>Sneak_s
omap <Leader>F <Plug>Sneak_S

" Thesaurus
nmap gK :!the <C-R><C-W><CR>

" Syntax highlighting for Lasp
autocmd BufNewFile,BufRead *.lasp setlocal ft=clojure
