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
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" Plugin Settings

" Settings
set shiftround " Snap to indentation multiples when indenting
