"=key mapping==================================

map <S-k> <C-w>k
map <S-j> <C-w>j
map <S-l> <C-w>l
map <S-h> <C-w>h
map <C-k> <C-w>-
map <C-j> <C-w>+
map <C-l> <C-w>>
map <C-h> <C-w><
map <C-c> <nop>
nmap f <C-f>
nmap F <C-b>
cmap <silent> qq qa

nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"useful
nnoremap M :<C-u>call append(expand('.'), '')<Cr>j
cmap w!! w !sudo tee > /dev/null %
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <C-g> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap ; :
nnoremap : ;
