" unmaps
map Q <Nop>
map K <Nop>

map <space> :
nmap <leader>w :w<cr>

" source vimrc
nmap <leader>v :w<cr>:so ~/.vimrc<cr>

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
nmap <leader>w <C-w>w

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

" inline ruby interpretation
" Example output when run over the top line:
"
"     3.times { |num| puts num }
"     # => 0
"     # => 1
"     # => 2
vmap <leader>r :!tee >(cat) \| ruby \| sed 's/^/\\# \=> /'<cr>
