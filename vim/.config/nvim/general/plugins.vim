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

Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" Plugin Settings
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
