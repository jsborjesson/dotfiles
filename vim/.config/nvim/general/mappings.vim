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

" Save and trim whitespace with C-s
nnoremap <C-s> :TrimWhitespace<CR>:write<CR>
xmap <C-s> <C-c><C-s>
imap <C-s> <C-c><C-s>

" Also clear highlights when clearing the screen
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

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


" Leader mappings
let g:mapleader="\<Space>"
let g:maplocalleader="\<Space>"

nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>w <C-w>

" Don't jump to the next selection with *#
nmap <Leader>* *``
nmap <Leader># #``
xmap <Leader>* *``
xmap <Leader># #``

" Turn on and off line length warning
nnoremap <Leader>8 :set colorcolumn=81<CR>
nnoremap <Leader>9 :set colorcolumn=121<CR>
nnoremap <Leader>0 :set colorcolumn=<CR>

" Spell mappings
nnoremap <Leader>ll :set spell!<CR>

" Add lower cased word to dictionary
nnoremap <Leader>zg guiwzgu
nnoremap <Leader>2zg guiw2zgu

function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>lf :call FixLastSpellingError()<cr>

" Wiki-mappings
" Quickly commit the current file in the wiki
nnoremap <Leader>nc :Gwrite<CR>:Git commit -m "Update <C-R>=strftime('%F %T')<CR>"<CR>
" Quickly create a dated file in the current directory
nnoremap <Leader>nf :edit %:h/<C-R>=strftime('%F_')<CR>.md<Left><Left><Left>

" Terminal mappings

" Make escape work as normal in terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>tv :vsplit term://bash<CR>i
nnoremap <Leader>ts :split term://bash<CR>i

" Rerun the last terminal command
nnoremap <Leader>tt <C-w><C-p>i<C-l><C-p><CR><C-\><C-n><C-w><C-p>

" :Search and :Replace
function! s:Search(search)
    " Save the search globally for the Replace command
    let g:last_search = a:search

    " Use vim-fugitive to search respecting .gitignore
    execute "Ggrep! " . a:search

    " Open the quickfix window and highlight the matches
    copen
    execute "match Search /" . a:search . "/"
endfunction
command! -nargs=1 Search call s:Search(<f-args>)

function! s:Replace(replacement)
    execute "cfdo %substitute/" . g:last_search . "/" . a:replacement . "/gec | update"
endfunction
command! -nargs=1 Replace call s:Replace(<f-args>)

nnoremap <Leader>s :Search<Space>
nnoremap <Leader>S :Replace<Space>
