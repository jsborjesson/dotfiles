""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Repeat command over multiple lines in visual mode
xnoremap <silent> . :normal .<CR>

" More ergonomic movements to line extremes
noremap gh ^
noremap gl $

" More sensical line movements when navigating wrapped lines
noremap j gj
noremap k gk

" Make J and gJ take a motion, and act on current line when doubled.
"
" To join a paragraph, normally you first have to select it by doing vipJ,
" this makes J take a motion so you can do Jip, and you can still get the old
" behaviour by doing JJ and gJJ, this is more consistent with other Vim commands.
nnoremap <silent> J :set operatorfunc=JoinOperator<CR>g@
nnoremap <silent> gJ :set operatorfunc=GJoinOperator<CR>g@
nnoremap JJ J
nnoremap gJJ gJ

function! JoinOperator(submode)
    '[,']join
endfunction

function! GJoinOperator(submode)
    '[,']join!
endfunction

" Resize splits using arrow keys
nnoremap <Up> :resize -10<CR>
nnoremap <Down> :resize +10<CR>
nnoremap <Left> :vertical resize -10<CR>
nnoremap <Right> :vertical resize +10<CR>

" Save and trim whitespace with C-s
nnoremap <C-s> :TrimWhitespace<CR>:write<CR>
xmap <C-s> <C-c><C-s>
imap <C-s> <C-c><C-s>

" Also clear highlights when clearing the screen
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Count matches of last search
nnoremap <Leader>7 :%s///ng<CR>


" Search for visual selection
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>w <C-w>

" Ergonomically copy to system clipboard
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>Y "+y$
xnoremap <Leader>Y "+y$

" Ergonomically paste from system clipboard
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

" Ergonomically delete without copying
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
nnoremap <Leader>D "_D
xnoremap <Leader>D "_D

" Don't jump to the next selection with *#
nmap <Leader>* *``
nmap <Leader># #``
xmap <Leader>* *``
xmap <Leader># #``

" Manually change the indentation level
nnoremap <Leader>2 :set shiftwidth=2<CR>
nnoremap <Leader>4 :set shiftwidth=4<CR>

" Turn on and off line length warning
nnoremap <Leader>8 :set colorcolumn=81<CR>
nnoremap <Leader>9 :set colorcolumn=121<CR>
nnoremap <Leader>0 :set colorcolumn=<CR>

" Spell mappings
nnoremap <Leader>zz :set spell!<CR>

nnoremap <Leader>z1 guiwzgu
nnoremap <Leader>z2 guiw2zgu

function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>lf :call FixLastSpellingError()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wiki-mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quickly commit the current file in the wiki
nnoremap <Leader>nc :Gwrite<CR>:Git commit -m "Update <C-R>=strftime('%F %T')<CR>"<CR>
" Quickly create a dated file in the current directory
nnoremap <Leader>nf :edit %:h/<C-R>=strftime('%F_')<CR>.md<Left><Left><Left>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make escape work as normal in terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>tv :vsplit term://bash<CR>
nnoremap <Leader>ts :split term://bash<CR>

" Rerun the last terminal command
"
" Move to the terminal split, clear and rerun the last command, then return to
" the last window.
nnoremap <Leader>tt :execute bufwinnr("term://") 'wincmd w'<CR>
            \i<C-l><C-p><CR><C-\><C-n><C-w><C-p>
