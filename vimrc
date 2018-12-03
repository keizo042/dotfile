if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif
set rtp+=~/.vim/
runtime! user/init/*.vim
runtime! user/autoload/*.vim

augroup FileTypes
  au!
  au BufNewFile,BufRead *.rb :runtime user/languages/ruby.vim
  au BufNewFile,BufRead *.ml :runtime user/languages/ocaml.vim
  au BufNewFile,BufRead *.hs :runtime user/languages/haskell.vim
  au BufNewFile,BufRead *.sh :runtime user/languages/bash.vim
  "au BufNewFile,BufRead *.js :runtime user/languages/javascript.vim
  au BufNewFile,BufRead *.js :set filetype=javascript
augroup END

if filereadable($HOME . "/.vimrc.local")
  runtime $HOME/.vimrc.local
endif
colo rdark
set fileformats=unix,mac,dos
let g:tagbar_phpctags_bin="~/.vim/bin/phpctags"
