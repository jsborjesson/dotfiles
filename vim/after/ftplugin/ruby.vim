" Default indentation settings
setlocal tabstop=2
setlocal shiftwidth=2

" Make file jumping work for spec support files
set path+=spec/

" ? and ! are part of method names
setlocal iskeyword+=?,!

" RSpec
let g:rspec_command = 'call VtrSendCommand("bundle exec rspec {spec}")'
nnoremap <buffer> <Leader>t<Leader>a :call RunAllSpecs()<CR>
nnoremap <buffer> <Leader>t<Leader>t :call RunNearestSpec()<CR>
nnoremap <buffer> <Leader>t<Leader>l :call RunLastSpec()<CR>
nnoremap <buffer> <Leader>t<Leader>d :call RunLastSpecWithDocumentation()<CR>
nnoremap <buffer> <Leader>t<Leader>f :call RunCurrentSpecFile()<CR>

function! RunLastSpecWithDocumentation()
    let l:old_rspec_command = g:rspec_command
    let g:rspec_command = 'call VtrSendCommand("bundle exec rspec {spec} --format=documentation")'

    call RunLastSpec()

    let g:rspec_command = l:old_rspec_command
endfunction


" AutoPairs
let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`', '|':'|'}

" Switch
let b:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['first', 'last'],
    \   ['before', 'after'],
    \   ['require', 'require_relative'],
    \   {
    \       '\(\w\+\)\[\([^]]*\)\]': '\1.fetch(\2)',
    \       '\(\w\+\)\.fetch(\([^)]*\))': '\1[\2]',
    \   },
    \   ['to', 'not_to'],
    \   ['assert', 'refute'],
    \   ['must', 'wont'],
    \ ]
