""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/junegunn/vim-plug/issues/739#issuecomment-516953621
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Declare plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugins')

Plug 'tpope/vim-commentary'    " Comment lines with gc
Plug 'tpope/vim-eunuch'        " :Rename, :Move, etc
Plug 'tpope/vim-fugitive'      " Git integration
Plug 'tpope/vim-rsi'           " Readline key-mappings for insert and command mode
Plug 'tpope/vim-sleuth'        " Set indentation settings automatically
Plug 'tpope/vim-surround'      " Motions to change brackets and quotes

Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'

Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-signify'
call plug#end()
