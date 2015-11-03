nnoremap <buffer> K :help <C-R><C-W><CR>
vnoremap <buffer> K "xy:help <C-R>x<CR>

" Switch
let b:switch_custom_definitions =
    \ [
    \   {
    \       '\zs\([cilnosvx]*\)map': '\1noremap',
    \       '\zs\([cilnosvx]*\)noremap': '\1map',
    \   },
    \ ]
