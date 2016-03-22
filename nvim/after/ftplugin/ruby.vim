" Default indentation settings
setlocal tabstop=2
setlocal shiftwidth=2

" ? and ! are part of method names
setlocal iskeyword+=?,!

" RSpec
let g:rspec_command = 'call VtrSendCommand('bundle exec rspec {spec}')'
nnoremap <buffer> <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <buffer> <Leader>s :call RunNearestSpec()<CR>
nnoremap <buffer> <Leader>l :call RunLastSpec()<CR>
nnoremap <buffer> <Leader>a :call RunAllSpecs()<CR>

" XmpFilter
nmap <buffer> <M-m> <Plug>(xmpfilter-mark)
xmap <buffer> <M-m> <Plug>(xmpfilter-mark)
imap <buffer> <M-m> <Plug>(xmpfilter-mark)

nmap <buffer> <M-r> <Plug>(xmpfilter-run)
xmap <buffer> <M-r> <Plug>(xmpfilter-run)
imap <buffer> <M-r> <Plug>(xmpfilter-run)

" AutoPairs
let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', '|':'|'}

" Switch
let b:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['to', 'not_to'],
    \   ['first', 'last'],
    \   {
    \       '\(\w\+\)\[\([^]]*\)\]': '\1.fetch(\2)',
    \       '\(\w\+\)\.fetch(\([^)]*\))': '\1[\2]',
    \   }
    \ ]
