nnoremap <buffer> K :help <C-r><C-w><CR>
vnoremap <buffer> K "xy:help <C-r>x<CR>

" Switch
let b:switch_custom_definitions =
    \ [
    \   {
    \       '\zs\([cilnosvx]*\)map': '\1noremap',
    \       '\zs\([cilnosvx]*\)noremap': '\1map',
    \   },
    \ ]
