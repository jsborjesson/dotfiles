let NERDTreeShowHidden=1

augroup nerdtree
    autocmd!

    " Close NERDTree if it's the last window
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END


nnoremap <Leader>dd :NERDTreeToggle<CR>
nnoremap <Leader>df :NERDTreeFind<CR>
