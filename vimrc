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
"curl -L https://git.io/haskell-vim-now > /tmp/haskell-vim-now.sh

"env varlable
"set foldmethod=syntax

"plugin env variable
set rtp+=~/.vim/bundle/vital.vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

let g:calendar_frame = 'default'

"plugin user variable
let s:Vital = vital#of('vital')

if !exists('loaded_matchit')
      " matchitを有効化
        runtime macros/matchit.vim
endif

let g:quickrun_config = {
                        \   "_" : {
                        \       "runner" : "vimproc",
                        \       "runner/vimproc/updatetime" : 40,
                        \       "outputter/buffer/name" : "execute" ,
                        \       "outputter/buffer/info" : 0,
                        \       "outputter/buffer/close_on_empty" : 1
                        \   },
                        \ 'watchdogs_checker/mruby' : {
                        \       'exec' : '%c %o --verbose %s:p'
                        \   },
                        \
                        \ "watchdogs_checker/dmd" : {
                        \ "exec" : " %c %o -c -o- %s:p"
                        \   },
                        \ "watchdogs_checker/ocamlc" : {
                        \ "exec" : " %c %o  %s:p"
                        \   },
                        \}

let g:quickrun_config.haskell = {
                        \ 'commnad' : 'stack',
                        \ 'exec' :  'stack exec runghc %s' , 
                        \}


"watchdogs
let g:watchdogs_check_BufWritePost_enable = 0
call watchdogs#setup(g:quickrun_config)

"incsearch.vim
let g:incsearch#auto_nohlsearch=0

"golang omni-complete

"haskell
let g:hpaste_author = 'keizo'
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_conceal_wide = 0

"if executable("stack")
"    let s:haskell_bins = ["ghc-mod", "endihasktags", "codex","hscope", "pointfree", "pointful", "hoogle", "stylish-haskell" ]
"    for bin in s:haskell_bins
"        if !executable(bin)
"            call system("stack install " + bin)
"        endif
"    endfor
"endif

"sonictemplate.vim
let g:sonictemplate_vim_template_dir=expand("~/.vim/templates")

"golang tagbar
let g:tagbar_type_go = {
                        \ 'ctagstype' : 'go',
                        \ 'kinds'     : [
                        \ 'p:package',
                        \ 'i:imports:1',
                        \ 'c:constants',
                        \ 'v:variables',
                        \ 't:types',
                        \ 'n:interfaces',
                        \ 'w:fields',
                        \ 'e:embedded',
                        \ 'm:methods',
                        \ 'r:constructor',
                        \ 'f:functions'
                        \ ],
                        \ 'sro' : '.',
                        \ 'kind2scope' : {
                        \ 't' : 'ctype',
                        \ 'n' : 'ntype'
                        \ },
                        \ 'scope2kind' : {
                        \ 'ctype' : 't',
                        \ 'ntype' : 'n'
                        \ },
                        \ 'ctagsbin'  : 'gotags',
                        \ 'ctagsargs' : '-sort -silent'
                        \ }
 if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
elseif  executable('hasktags')
let  g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
endif 
"nim tabgar
let g:tagbar_type_nim = {
      \ 'ctagstype' : 'nim',
      \ 'kinds' : [
      \   'h:Headline',
      \   't:class',
      \   't:enum',
      \   't:tuple',
      \   't:subrange',
      \   't:proctype',
      \   'f:procedure',
      \   'f:method',
      \   'o:operator',
      \   't:template',
      \   'm:macro',
      \ ],
      \}


"=My default==================================================
if filereadable($HOME . "/.vimrc.local")
        source $HOME/.vimrc.local
endif


"different OS env settings
if has("win32") || has("win64")
        set termencoding=cp932
        "    set fileencodings=ucs-bom,iso-2022-jp,cp932,sjis,euc-jp,utf-8


elseif has("mac")
        set fileencoding=utf-8
        set fileencodings=utf-8,sjis,euc-jp,cp932
        set termencoding=utf-8

else
        set fileencoding=utf-8
        set fileencodings=utf-8,sjis,euc-jp,cp932
        set termencoding=utf-8
endif

"status
set laststatus=2
set completeopt=menu,preview,longest
set showcmd
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [LEN=%L]
set nowritebackup
set notitle
set noswapfile
set ruler       
set history=100 "log
set noerrorbells "unline errorbells
set ttimeout "command time out
set ttimeoutlen=500
set number
set linebreak
set autoread


"set cursorline
"set cursorcolumn
set wildmenu
set wildmode=longest:full,full


"tab
set smartindent
set autoindent
setlocal cindent
set expandtab
setlocal formatoptions-=r
setlocal formatoptions-=o



"search
set wrapscan
set wrap
set wrapmargin=0
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set ambiwidth=double "unicode encoding setting
set browsedir=buffer
set nofoldenable
"set complete

"syntax
syntax on
set background=dark
colo rdark


let g:tab_seted =0
function! s:Tab_size_define(tab_size)
        let g:tab_seted=1
        if a:tab_size != 0
                let &l:shiftwidth=a:tab_size
                let &l:softtabstop=a:tab_size
        else
                let &l:shiftwidth=4
                let &l:softtabstop=4
        end
endfunction

function! s:Tab_hard_define()
        let g:tab_seted=1
        setlocal noexpandtab
endfunction
if g:tab_seted !=1
        call s:Tab_size_define(4)
endif

function! s:InstallRustEnv()
    if !isdirectory(expand("~/bin/racer"))
    system("git clone https://github.com/phildawes/racer.git ~/bin/racer")
    system("cd ~/bin/racer;cargo build --release")
    endif
    
endfunction


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
augroup END

augroup LANGUAGES_SETTING
        autocmd!
        autocmd! BufNewFile,BufRead *.cabal,*.html,*.cc,*.cpp,*.cxx,*.xx,*.tmlp,*.rb,*.hs,*.ml,*.scala call s:Tab_size_define(2)
        autocmd! BufNewFile,BufRead *.py,*.c,,*.cxx,*.hx,*.d, call s:Tab_size_define(4)
        autocmd! BufNewFile,BufRead *.go call s:Tab_hard_define()
        autocmd! BufNewFile,BufRead *.go nnoremap <C-n> <C-x><C-o>
        autocmd! BufNewFile,BufRead *.go set noexpandtab
        autocmd! FileType erlang setlocal makeprg=erlc\ %
        autocmd! FileType erlang setlocal errorformat=%f:%l:\ %m
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



augroup haskell_keymaps
    autocmd!
    autocmd FileType haskell nmap <silent> <C-n>  :GhcModType<CR>
    autocmd FileType haskell nmap <silent> <C-x> :GhcModTypeInsert<CR>
"    autocmd BufWritePost *.hs GhcModCheck
    autocmd FileType haskell command! W GhcModCheck
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


