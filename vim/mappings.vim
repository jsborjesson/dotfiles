
" ==================== Mappings ====================

" unmaps
map Q <Nop>
map K <Nop>

" command mode with space
nmap <space> :
map <space> :

" leader commands

" navigation
nmap <leader>p <C-p>
nnoremap <leader>m :NERDTree<cr>
nnoremap <leader>M :NERDTreeFind<cr>
nmap <leader><leader> <C-^>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>x :wq<cr>
nmap <leader>c :!

" split navkgation
nmap <leader>s <C-w>w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>fw :FixWhitespace<cr>
vmap <enter> <plug>(EasyAlign)
nmap <leader>t :! rake test<cr>

" git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>
