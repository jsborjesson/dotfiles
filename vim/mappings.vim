" unmaps
map Q <Nop>
map K <Nop>

" command mode with space
nmap <space> :
map <space> :

" leader commands

" navigation
nmap <leader>p <C-p>
nmap <leader><leader> <C-^>
nmap <leader>w :w<cr>
nmap <leader>q @q
nmap <leader>x :!

" split navkgation
nmap <leader>s <C-w>w
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>t :w<cr>:! rake test<cr>

" ==================== Plugins ====================

nmap <leader>fw :FixWhitespace<cr>
vmap <enter> <plug>(EasyAlign)
nmap <leader>m :NERDTree<cr>
nmap <leader>M :NERDTreeFind<cr>

" Git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>
