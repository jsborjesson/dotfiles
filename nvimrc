" ==================== Plugins ====================
call plug#begin('~/.nvim/plugged')

" Vim standard library
Plug 'tpope/vim-abolish'     " Case insensitive search and camel/snake/mixed-switching
Plug 'tpope/vim-commentary'  " Comment lines with gc
Plug 'tpope/vim-endwise'     " Put in end automatically
Plug 'tpope/vim-eunuch'      " Unix helpers such as :Move, :Rename and :SudoWrite
Plug 'tpope/vim-fugitive'    " Git helpers
Plug 'tpope/vim-repeat'      " Make . work with plugins
Plug 'tpope/vim-rsi'         " Readline key-mappings for insert and command mode
Plug 'tpope/vim-sleuth'      " Set indentation settings automatically
Plug 'tpope/vim-speeddating' " Makes C-a and C-x work for dates
Plug 'tpope/vim-surround'    " Change surrounding quotes, tags...
Plug 'tpope/vim-unimpaired'  " Lots of clever pairs of mappings
Plug 'tpope/vim-vinegar'     " Better netrw filebrowser

" Extra text-objects and motions
Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-sort-motion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/vim-easy-align'

" Extra features
Plug 'AndrewRadev/switch.vim' " Clever toggling with gs
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'kopischke/vim-fetch'   " Handle line:column numbers in filenames
Plug 'flazz/vim-colorschemes'
Plug 'rking/ag.vim'
Plug 'vim-scripts/ReplaceWithRegister'

" Ruby
Plug 'jgdavey/vim-blockle',                        { 'for': 'ruby'    }
Plug 'rhysd/vim-textobj-ruby',                     { 'for': 'ruby'    }
Plug 'slim-template/vim-slim',                     { 'for': 'ruby'    }
Plug 'thoughtbot/vim-rspec',                       { 'for': 'ruby'    }
Plug 'tpope/vim-bundler',                          { 'for': 'ruby'    }
Plug 'tpope/vim-rake',                             { 'for': 'ruby'    }
Plug 'tpope/vim-rbenv',                            { 'for': 'ruby'    }
Plug 'vim-ruby/vim-ruby',                          { 'for': 'ruby'    }

" Clojure
Plug 'tpope/vim-fireplace',                        { 'for': 'clojure' }
Plug 'tpope/vim-salve',                            { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

" Rust
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" Trial
Plug 'tpope/vim-liquid'
Plug 'freitass/todo.txt-vim'

call plug#end()

runtime macros/matchit.vim

syntax on

" ==================== Theme ====================

" List of colors here: https://github.com/flazz/vim-colorschemes/tree/master/colors
colorscheme blackboard
highlight SignColumn guifg=#eeeeee guibg=#090B18
highlight VertSplit guifg=#eeeeee guibg=#090B18
highlight Comment guifg=gray

" Make sure colors work in tmux
if exists('$TMUX')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Thin cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" No split separator char
set fillchars+=vert:\  " There's significant whitespace before this comment

" ==================== autocmds ====================
augroup settings
    " Make sure to not register the autocmds again when reloading nvimrc
    autocmd!

    " Reload .nvimrc on save
    autocmd BufWritePost nvimrc source $MYVIMRC

    " Don't insert comments with O
    autocmd FileType * setlocal formatoptions-=o

    " Relative numbers in command mode, and normal in insert mode
    " autocmd InsertEnter * set norelativenumber
    " autocmd InsertLeave * set relativenumber

    " Automatically rebalance splits on resize
    autocmd VimResized * :wincmd =
augroup END

" ==================== Whitespace ====================
" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred

augroup whitespace
    autocmd!

    autocmd BufRead * match ExtraWhitespace /^\s\+$/

    " The above flashes annoyingly while typing, be calmer in insert mode
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

function! TrimWhitespace()
    let l:save_cursor = getpos('.')

    " Remove trailing whitespace at the end of lines
    silent! execute ':%s/\s\+$//'

    " Remove trailing newlines at the end of file
    silent! execute ':%s/\($\n\s*\)\+\%$//'

    call setpos('.', l:save_cursor)
endfunction

command! TrimWhitespace execute ':call TrimWhitespace()'


" ==================== Settings ====================
set hidden
set gdefault
set clipboard=unnamed " Yank to system clipboard
set nojoinspaces      " Join lines containing punctuation correctly
set lazyredraw        " Don't redraw until macro has finished running
set nowrap
set number
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

" Enable per project nvimrc:s
set exrc
set secure

" Share spellfile in Dropbox
set spellfile=~/Dropbox/apps/nvim/en.utf-8.add

" Fix escape lag
set ttimeout
set ttimeoutlen=1

" Statusline
set laststatus=2
set statusline=\ %F                                     " Path
set statusline+=\ %y                                    " File type
set statusline+=\ (%{fugitive#head(8)})                 " Git branch
set statusline+=%=                                      " Right align after this
set statusline+=\ Line:\ %l/%L\ (%P)\ \|\ Column:\ %c\  " Line/Column

" Load shell aliases
let $BASH_ENV = '~/.alias'

" Increase scrollback in terminal mode
let g:terminal_scrollback_buffer_size=10000

" ==================== Vim++ mappings ====================
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

" Correct J and gJ to take a motion, and act on current line when doubled.
"
" To join a paragraph, normally you first have to select it by doing vipJ,
" this makes J take a motion so you can do Jip, and you can still get the old
" behaviour by doing JJ and gJJ, this is much more consistent with other Vim
" commands.
nnoremap <silent> J  :set operatorfunc=JoinOperator<CR>g@
nnoremap <silent> gJ :set operatorfunc=GJoinOperator<CR>g@
nnoremap JJ J
nnoremap gJJ gJ

function! JoinOperator(submode)
    '[,']join
endfunction

function! GJoinOperator(submode)
    '[,']join!
endfunction


" ==================== Key mappings ====================

" Navigate wrapped lines easier
nnoremap j gj
nnoremap k gk

" Shift-; to do the opposite of ; makes a lot of sense, and : now gets the
" prime real estate it deserves.
noremap : ,
noremap , :

" Run the q macro instead of stupid Ex-mode
nnoremap Q @q

" Run the q macro over multiple lines
xnoremap Q :normal @q<CR>

" Quick clear search highlights
nnoremap <silent> <C-L> :nohlsearch<CR>:diffupdate<CR><C-L>

" Scroll with the cursor in the middle
nnoremap <C-E> <C-E>M
nnoremap <C-Y> <C-Y>M

" Save with C-s
nnoremap <C-S> :TrimWhitespace<CR>:write<CR>
vmap <C-S> <Esc><C-S>gv
imap <C-S> <Esc><C-S>

" Escape in terminal mode
tnoremap <Esc><Esc> <C-\><C-N>

" Bring in path to folder of current file in command-line with %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ==================== Special characters ====================
" Overlays the Swedish åäö letters in their correct places with alt
inoremap <M-[> <C-K>aa
inoremap <M-'> <C-K>a:
inoremap <M-;> <C-K>o:
inoremap <M-{> <C-K>AA
inoremap <M-"> <C-K>A:
inoremap <M-:> <C-K>O:

" ==================== Leader commands ====================
" Mappings that I haven't found a better key combination for yet.

let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

" Manually reload nvimrc
nnoremap <Leader>r :source $MYVIMRC<CR>

" Go to last file
nnoremap <Leader><Leader> <C-^>

" Highlight word but don't jump to the next match
nmap <Leader>* *``
nmap <Leader># #``
xmap <Leader>* *``
xmap <Leader># #``

" Maximize split
nnoremap <Leader>z :silent tabedit %<CR>

" Enter insert mode with correct indentation
nnoremap <Leader><Tab> ddO

" Wrap until end of line in parenthesis
nmap <Leader>( ysg_)
nmap <Leader>) "_xysg_)

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

" Commentary
let g:commentary_map_backslash=0

" EasyAlign
vmap g<Space> <Plug>(EasyAlign)
nmap g<Space> <Plug>(EasyAlign)

" Support vim comments too
let g:easy_align_delimiters = { '"': { 'pattern': '"\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  } }

" Fugitive
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gf :Gwrite<CR>:Gcommit -v<CR>i
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gh :Gbrowse<CR>
xnoremap <Leader>gh :Gbrowse<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager    = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_removed_first_line = '_^'
nmap <Leader>gA <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterRevertHunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" UltiSnips
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

" AutoPairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutToggle = ''

" Disable some vim-sexp mappings to make space for tmux navigator
let g:sexp_mappings = {
    \ 'sexp_swap_list_backward':    '',
    \ 'sexp_swap_list_forward':     '',
    \ 'sexp_swap_element_backward': '',
    \ 'sexp_swap_element_forward':  '',
    \ }
let g:sexp_enable_insert_mode_mappings = 0

" Tmux interaction
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-o> :TmuxNavigatePrevious<CR>

nnoremap <Leader>v :VtrAttachToPane<CR>

nnoremap <silent> <C-f> :VtrSendLinesToRunner<CR>
xnoremap <silent> <C-f> :VtrSendLinesToRunner<CR>

" Switch
let g:switch_mapping = '<Leader>gs'

" Thesaurus
nmap gK :!the <C-R><C-W><CR>

" Syntax highlighting for Läsp
autocmd BufNewFile,BufRead *.lasp setlocal ft=clojure
