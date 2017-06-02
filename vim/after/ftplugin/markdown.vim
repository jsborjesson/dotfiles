setlocal wrap
setlocal linebreak
setlocal spell

nnoremap <Leader>m :!mark %<CR><CR>

" Markdown should use 4 space indentation, for code blocks
setlocal shiftwidth=4

" Make names with annoying capitalisation easy to type
iabbrev readme README
iabbrev rubocop RuboCop
iabbrev github GitHub
