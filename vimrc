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
let g:racer_cmd = expand('~/.cargo/bin/racer')

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
let g:rustfmt_autosave = 1
if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif
