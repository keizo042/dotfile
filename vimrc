let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
set rtp+=~/misc/src/github.com/keizo042/dotfile/vim
for f in split(glob('~/misc/src/github.com/keizo042/dotfile/vim/user/init/*.vim'), '\n')
    exe 'source' f
endfor
for f in split(glob('~/misc/src/github.com/keizo042/dotfile/vim/user/autoload/*.vim'), '\n')
    exe 'source' f
endfor
source ~/.vimrc.local
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

