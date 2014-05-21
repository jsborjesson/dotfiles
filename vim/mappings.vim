" unmaps
map Q <Nop>
map K <Nop>

map <space> :
nmap <esc><esc> :w<cr>

" source vimrc
nmap <leader>s :w<cr>:so ~/.vimrc<cr>

" navigation
nmap <leader>f <C-p>
nmap <leader><leader> <C-^>
nmap <leader>q @q
nmap <leader>x :!

" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" split navkgation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" save and test
nmap <leader>t :w<cr>:! rake test<cr>

" plugins

vmap <enter> <plug>(EasyAlign)
nmap <leader>m :NERDTree<cr>
nmap <leader>M :NERDTreeFind<cr>

" git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>
