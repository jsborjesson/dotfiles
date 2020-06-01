" Plugins
" https://github.com/junegunn/vim-plug/issues/739#issuecomment-516953621
let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')
Plug 'tpope/vim-commentary'    " Comment lines with gc
Plug 'tpope/vim-sleuth'        " Set indentation settings automatically

Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" Plugin Settings
let g:ctrlp_map = '<Leader>f'

" Settings
set shiftround " Snap to indentation multiples when indenting


" Whitespace

" Highlight EOL whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/

augroup whitespace
    autocmd!

    " https://vim.fandom.com/wiki/Highlight_unwanted_spaces
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" Trim trailing spaces and newlines
function! TrimWhitespace()
    let l:save_cursor = getpos('.')

    " Remove trailing whitespace at the end of lines
    silent! execute ':%s/\s\+$//'

    " Remove trailing newlines at the end of file
    silent! execute ':%s/\($\n\s*\)\+\%$//'

    call setpos('.', l:save_cursor)
endfunction

command! TrimWhitespace call TrimWhitespace()

" Mappings

" Create macros with m
"
" Macros deserve an even better place than q, they are so important that the
" lower case m should be for macro, not marker.
nnoremap m q

" Create markers with Q
"
" I use them far less than macros, and it gives them a slightly less prominent
" but still decent mnemonic 'quote' since you jump to them with ` and '.
nnoremap Q m

" Quit with q
"
" Some windows already work like this, but it's very confusing which ones they
" are. Quitting is common and deserves this unambiguous lower-case key.
nnoremap <silent> q :q<CR>

" Redo with U
"
" Redoing is a very common action and should follow the same convention as
" many other commands where the shifted key is the opposite.
nnoremap U <C-r>

" Yank to end of line with Y
"
" Yank entire line is still available with yy
nnoremap Y y$

" More ergonomic movements to line extremes
noremap gh ^
noremap gl $

" Save and trim whitespace with C-s
nnoremap <C-s> :TrimWhitespace<CR>:write<CR>
xmap <C-s> <C-c><C-s>
imap <C-s> <C-c><C-s>

" Leader mappings
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"
