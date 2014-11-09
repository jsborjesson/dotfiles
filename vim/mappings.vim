" source vimrc
nmap <leader>v :w<cr>:so ~/.vimrc<cr>

" unmaps
map Q <Nop>
map K <Nop>

" U for redo is much more natural
nnoremap U <C-r>

map <space> :

nmap <enter> :nohlsearch<cr>

nmap <C-s> :update<cr>
vmap <C-s> <Esc><C-s>gv
imap <C-s> <Esc><C-s>

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
nmap <leader>s <C-w>w
nnoremap <silent> <leader>+ :vertical resize +10<cr>
nnoremap <silent> <leader>- :vertical resize -10<cr>

" save and rake
nmap <leader>r :w<cr>:! rake<cr>

" plugins
vmap <enter> <plug>(EasyAlign)
nmap <leader>m :NERDTree<cr>
nmap <leader>M :NERDTreeFind<cr>
nmap <leader>f <C-p>

" git
nmap <leader>ga :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gac :Gwrite<cr>:Gcommit -m ""<left>
nmap <leader>gp :Git push<cr>
nmap <leader>gb :Gbrowse<cr>

" Open with pry
nmap <leader>p :!pry -r ./%<cr>

" Seeing is believing
nmap <F5> <Plug>(seeing-is-believing-run)
xmap <F5> <Plug>(seeing-is-believing-run)
imap <F5> <Plug>(seeing-is-believing-run)

nmap <F4> <Plug>(seeing-is-believing-mark)
xmap <F4> <Plug>(seeing-is-believing-mark)
imap <F4> <Plug>(seeing-is-believing-mark)
