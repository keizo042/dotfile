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


"colo rdark
set fileformats=unix,mac,dos
set encoding=utf8

let g:ctrlp_use_caching=0
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
set encoding=utf8
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
let g:racer_cmd = "/home/user/.cargo/bin/racer"

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
