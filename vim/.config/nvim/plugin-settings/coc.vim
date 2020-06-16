" Don't shift the text when adding diagnostics
set signcolumn=yes

" Manually trigger completions
inoremap <silent><expr> <C-l> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming
nmap <Leader>cr <Plug>(coc-rename)

" Formatting selected code
xmap <silent> <Leader>cf <Plug>(coc-format-selected)
nmap <silent> <Leader>cf <Plug>(coc-format-selected)
nmap <silent> <Leader>cF <Plug>(coc-format)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
