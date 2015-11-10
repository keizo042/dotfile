"keizo'vimrc

if has('vim_starting')
        set nocompatible               " Be iMproved
        set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

filetype indent off
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim' 

"asynchronous execution library
NeoBundle 'Shougo/vimproc.vim', {
                        \ 'build' : {
                        \     'windows' : 'make -f make_mingw32.mak',
                        \     'cygwin' : 'make -f make_cygwin.mak',
                        \     'mac' : 'make -f make_mac.mak',
                        \     'unix' : 'make -f make_unix.mak',
                        \    },
                        \ }

"default bundle plugins
NeoBundle 'vim-jp/vital.vim'        "vim lib
NeoBundle 'vim-scripts/rdark'       "syntex highlight
NeoBundle 'tpope/vim-surround'      "ext obj ctrl
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vcscommand.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'katono/rogue.vim'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'aharisu/vise'
"NeoBundle 'mattn/lisper-vim'
"NeoBundle 'airblade/vim-rooter'
"template
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle "osyo-manga/vim-watchdogs", {
                        \ 'depends' : [
                        \       "osyo-manga/shabadou.vim",
                        \       'thinca/vim-quickrun',
                        \       ],
                        \ }

"maybe use in the future
"NeoBundle 'thica/vim-ref'


"Lazy plugin : ft
NeoBundleLazy 'mattn/emmet-vim', { 
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'html', "gohtmltmpl", "hamlet" ],
                        \           },
                        \ }
NeoBundleLazy 'othree/html5.vim', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'html', "gohtmltmpl" ],
                        \           },
                        \ }
NeoBundleLazy 'vim-jp/cpp-vim', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'cpp' ], 
                        \           },
                        \ }
NeoBundleLazy 'osyo-manga/vim-stargate', {
                        \ 'autoload' : {
                        \       'filetypes' : 'cpp'
                        \           },
                        \ }
NeoBundleLazy 'JesseKPhillips/d.vim', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'd' ],
                        \           },
                        \}
NeoBundleLazy 'osyo-manga/vim-marching', {
                        \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
                        \ 'autoload' : {'filetypes' : ['c', 'cpp']}
                        \ }
NeoBundleLazy 'fatih/vim-go', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'go' ],
                        \           },
                        \}
NeoBundleLazy 'vim-jp/vim-go-extra', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'go' ],
                        \           },
                        \}
NeoBundleLazy 'slim-template/vim-slim', {
                        \ 'autoload' : {
                        \       'filetype' : 'ruby',
                        \          },
                        \}

"NeoBundleLazy 'fatih/vim-go'
"haskell
NeoBundleLazy 'itchyny/vim-haskell-indent',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }
NeoBundleLazy 'eagletmt/ghcmod-vim',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }
NeoBundleLazy 'ujihisa/unite-haskellimport',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }
NeoBundleLazy 'dag/vim2hs', {
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }
NeoBundleLazy 'eagletmt/unite-haddock',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }

NeoBundle 'ujihisa/ref-hoogle',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'haskell' ] ,
                        \           },
                        \ }


NeoBundleLazy 'pbrisbin/vim-syntax-shakespeare',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'hamlet', 'cassius', 'lucius', 'julius' ] ,
                        \           },
                        \ }
"erlang
NeoBundleLazy 'vim-erlang/vim-erlang-runtime', {
                        \       'autoload' : {
                        \       'filetypes' : 'erlang' ,
                        \               },
                        \ }
" erlangのオムニ補完
NeoBundle 'vim-erlang/vim-erlang-omnicomplete', {
                        \       'autoload' : {
                        \       'filetypes' : 'erlang' ,
                        \               },
                        \ }

" erlファイルをerlangとして認識する

"NeoBundle 'menezrick/vimerl'


"scala
NeoBundleLazy 'derekwyatt/vim-scala', {
                        \'autoload' : {
                        \   'filetypes' : [ 'scala' ],
                        \           },
                        \ }
NeoBundleLazy 'gre/play2vim',{
                        \ 'autoload' : { 
                        \   'filetypes' : [ 'scala' ],
                        \           },
                        \}
"clojure
NeoBundleLazy 'guns/vim-clojure-static', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'clojure' ],
                        \           },
                        \}

NeoBundleLazy 'tpope/vim-fireplace', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'clojure' ],
                        \           },
                        \}
NeoBundleLazy 'OmniSharp/omnisharp-vim'
NeoBundleLazy 'kongo2002/fsharp-vim', {
                        \ 'autoload' : {
                        \       'filetypes' : 'fsharp',
                        \           },
                        \ }
NeoBundleLazy 'zah/nimrod.vim', {
                        \ 'autoload' : {
                        \       'filetypes' : 'nim',
                        \           },
                        \ }
"vim
NeoBundleLazy 'ynkdir/vim-vimlparser', {
                        \ 'autoload' : { 
                        \       'filetypes' : [ 'vim'],
                        \           },
                        \}
"ocaml
"NeoBundleLazy 'cohama/the-ocamlspot.vim',{
"                        \ 'autoload' : { 
"                        \       'filetypes' : [ 'ocaml' ],
"                        \           },
"                        \ }

"TypeScript
NeoBundleLazy 'leafgarland/typescript-vim',{
                        \'autoload' : { 
                        \       'filetypes' : ['typescript'],
                        \           },
                        \ }
NeoBundleLazy 'clausreinke/typescript-tools',{
                        \'autoload' : { 
                        \       'filetypes' : ['typescript'],
                        \           },
                        \ }
"haxe
NeoBundleLazy 'jdonaldson/vaxe',{
                        \ 'autoload' : { 
                        \       'filetypes' : ['haxe']
                        \           },
                        \}
NeoBundleLazy 'MarcWeber/vim-haxe-syntax',{
                        \ 'autoload' : { 
                        \       'filetypes' : ['haxe'],
                        \           },
                        \}
NeoBundleLazy 'pangloss/vim-javascript',{
                        \ 'autoload' : {
                        \       'filetypes' : 'javascript',
                        \           },
                        \}
NeoBundleLazy 'maksimr/vim-jsbeautify' ,{
                        \ 'autoload' : {
                        \       'filetypes' : 'javascript',
                        \           },
                        \}

NeoBundleLazy 'Shougo/vinarise',{
                        \ 'disabled' : !has('python')
                        \}
"latex
NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex',{
                        \ 'autoload' : {
                        \       'filetypes' : [ 'tex' ],
                        \   }
                        \}
"data structure
"NeoBundleLazy 'othree/xml.vim', {
"                        \ 'autoload' : {
"                        \       'filetypes' : 'xml',
"                        \       }
"                        \ }
NeoBundleLazy 'elzr/vim-json',{
                        \'autoload' : {
                        \       'filetypes' : [ 'json' ],
                        \           }
                        \}
NeoBundleLazy 'ingydotnet/yaml-vim',{
                        \'autoload' : {
                        \       'filetypes' : [ 'yaml' ],
                        \           }
                        \}
NeoBundleLazy 'pld-linux/vim-syntax-vcl',{
                        \'autoload' : {
                        \       'filetypes' : [ 'vcl' ],
                        \           }
                        \}
NeoBundleLazy 'smerrill/vcl-vim-plugin',{
                        \'autoload' : {
                        \       'filetypes' : [ 'vcl' ],
                        \           }
                        \}
"NeoBundleLazy 'Yggdroot/indentLine'
"=========================
"os diff plugin

NeoBundle 'Shougo/vimshell.vim',{
                        \'disabled' : has('win')
                        \}
"disable windows
NeoBundle 'tyru/open-browser.vim',{
                        \ 'disabled' : has('win')
                        \}   
NeoBundle 'tyru/open-browser-github.vim', {
                        \ 'disabled' : has('win')
                        \}
"linux only
NeoBundle 'itchyny/calendar.vim', {
                        \ 'disabled' : !has('unix'),
                        \}

call neobundle#end()
filetype plugin indent on     " Required!
NeoBundleCheck

"env varlable
"set foldmethod=syntax

"plugin env variable
set rtp+=~/.vim/bundle/vital.vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

let g:calendar_frame = 'default'

"plugin user variable
let s:Vital = vital#of('vital')


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
"if github.com/nsf/gocode 

"haskell
let g:hpaste_author = 'keizo'
let g:haskell_conceal = 0

"sonictemplate.vim
let g:sonictemplate_vim_template_dir=expand("~/.vim/template")

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
if has("./.vimrc.local")
        source ./.vimrc.local
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
        autocmd! BufNewFile,BufRead *.html,*.tmlp,*.rb,*.scala call s:Tab_size_define(2)
        autocmd! BufNewFile,BufRead *.py,*.c,*.cpp,*.cxx,*.hs,*.hx,*.d, call s:Tab_size_define(4)
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

"user command 
command! W WatchdogsRun

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


