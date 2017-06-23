"keizo'vimrc

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif
source $HOME/.config/dotfile/vimrc.plug
source $HOME/.config/dotfile/vimrc.tagbar
source $HOME/.config/dotfile/vimrc.quickrun
source $HOME/.config/dotfile/vimrc.enc
source $HOME/.config/dotfile/vimrc.param
source $HOME/.config/dotfile/vimrc.tab
if filereadable($HOME . "/.vimrc.local")
        source $HOME/.vimrc.local
endif
if !exists('loaded_matchit')
      " matchitを有効化
        runtime macros/matchit.vim
endif

"plugin env variable
set rtp+=~/.vim/bundle/vital.vim
let s:Vital = vital#of('vital')
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

"watchdogs
let g:watchdogs_check_BufWritePost_enable = 0
let g:incsearch#auto_nohlsearch=0
let g:hpaste_author = 'keizo'
let g:sonictemplate_vim_template_dir=expand("~/.vim/templates")
call watchdogs#setup(g:quickrun_config)





function! s:InstallRustEnv()
    if !isdirectory(expand("~/bin/racer"))
    system("git clone https://github.com/phildawes/racer.git ~/bin/racer")
    system("cd ~/bin/racer;cargo build --release")
    endif
endfunction

function! s:ReadHaskellVimrc() 
    source ~/.vim/haskell.vimrc
endfunction

if isdirectory(expand("./.stack-work"))
  call s:ReadHaskellVimrc()
endif

"augroups
"============================
"============================
augroup ftpsetting
        autocmd!
        autocmd! FileType * setlocal formatoptions-=ro
        autocmd! BufNewFile,BufRead *.ts setf typescript
        autocmd  BufNewFile,BufRead *.vcl setf vcl
        autocmd! BufNewFile,BufRead *.erl setf erlang
        autocmd! BufNewFile,BufRead *.scala setfiletype scala 
        autocmd! BufNewFile,BufRead *vim* setfiletype VIM 
        autocmd! BufNewFile,BufRead *.clj setfiletype clojure
        autocmd! BufNewFile,BufRead *.go setfiletype go 
        autocmd! BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=MARKDOWN
        autocmd! BufNewfile,BufRead *.gembox setfiletype RUBY
        autocmd! BufNewFile,BufRead *.hx setfiletype HAXE
        autocmd! FileType erlang setlocal makeprg=erlc\ %
        autocmd! FileType erlang setlocal errorformat=%f:%l:\ %m
        autocmd! BufNewFile,BufRead *.go nnoremap <C-n> <C-x><C-o>
augroup END

augroup BinaryXXD
        autocmd!
        au BufReadPre  *.{o,exe*} let &bin=1
        au BufReadPost *.{o,exe*} if &bin | %!xxd
        au BufReadPost *.{o,exe*} set ft=xxd | endif
        au BufWritePre *.{o,exe*} if &bin | %!xxd -r
        au BufWritePre *.{o,exe*} endif
        au BufWritePost *.{o,exe*} if &bin | %!xxd
        au BufWritePost *.{o,exe*} set nomod | endif
augroup END

"augroup ghcmodcheck
"  autocmd! BufWritePost *.hs,<buffer> GhcModCheckAsync
"augroup END

"finalized

"=key mapping==================================
"意地でもctrl は押さない方向で

" split move
map <S-k> <C-w>k
map <S-j> <C-w>j
map <S-l> <C-w>l
map <S-h> <C-w>h
" splitsize
map <C-k> <C-w>-
map <C-j> <C-w>+
map <C-l> <C-w>>
map <C-h> <C-w><
map <C-c> <nop>
nmap f <C-f>
nmap F <C-b>
cmap <silent> qq qa

"useful
nnoremap M :<C-u>call append(expand('.'), '')<Cr>j
cmap w!! w !sudo tee > /dev/null %
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <C-g> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>


function s:stylish_haskell()

    if executable("stylish-haskell")
        %!stylish-haskell
    endif
endfunction


augroup haskell_keymaps
    autocmd!
    autocmd FileType haskell nmap <silent> <C-n>  :GhcModType<CR>
    autocmd FileType haskell nmap <silent> <C-x> :GhcModTypeInsert<CR>
"    autocmd BufWritePost *.hs GhcModCheck
    autocmd FileType haskell command! W GhcModCheck
    autocmd FileType haskell command! Stylish call s:stylish_haskell()
augroup End

augroup coq_keymaps
    autocmd! 
    au FileType coq call coquille#CoqideMapping()
    autocmd FileType coq nmap <LocalLeader>s :CoqStart<CR>
augroup End



"command! -buffer -nargs=+ -complete=customlist,s:completePackage ImportAll call s:wrapImportAll(<f-args>)
"command! -buffer -nargs=* -complete=customlist,s:completePackage ImportAsAll call s:WrapImportAsAll( <f-args>)
"command! Goimports  echo system("go list -f '{{ join .Imports \"\n\" }}'" .   expand("%:p"))


"" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"map <Leader>lh :call s:ReadHaskellVimrc()<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merlin/vim'
execute 'set rtp^=' . g:opamshare . '/ocp-indent/vim'
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## e2adc493b925f82cbc42418165639539 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  "source "/Users/keizo/.opam/system/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
