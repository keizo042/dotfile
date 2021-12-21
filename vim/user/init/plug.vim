
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug',
            \ {'dir': '~/.vim/plugged/vim-plug/autoload'}

Plug 'jjo/vim-cue'
Plug 'pantharshit00/vim-prisma'
Plug 'google/vim-jsonnet'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-fz'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'Shougo/unite.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-scripts/rdark'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-jp/vital.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'tag': '4.0.0'}
"Plug 'justinmk/vim-dirvish'
Plug 'thinca/vim-ref'
Plug 'thinca/vim-quickrun'
Plug 'mattn/sonictemplate-vim'
Plug 'udalov/kotlin-vim'
Plug 'Shougo/vimproc.vim' 
Plug 'osyo-manga/vim-reunions' 
Plug 'let-def/vimbufsync'
Plug 'ekalinin/Dockerfile.vim'
Plug 'aklt/plantuml-syntax', { 'for' : [ 'plantuml' ] }

" Plug 'aharisu/vise'
" Plug 'mattn/lisper-vim'
" Plug 'airblade/vim-rooter'
" template

Plug 'mattn/emmet-vim', { 'for' : [ 'html' ]}
Plug 'othree/html5.vim', {'for' : [ 'html'  ] }
Plug 'vim-jp/cpp-vim', { 'for' : [ 'cpp' ] }
Plug 'rhysd/vim-clang-format', {
                        \        'for' : [ 'cpp', 'c' ]
                        \ }
Plug 'osyo-manga/vim-stargate', {
                        \       'for' : 'cpp'
                        \ }

Plug 'the-lambda-church/coquille', {
                        \       'for' : [ 'coq' ]
                        \}
Plug 'JesseKPhillips/d.vim', {
                        \       'for' : [ 'd' ]
                        \}

Plug 'osyo-manga/vim-marching', {
                        \  'for' : ['c', 'cpp'] 
                        \ }
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'rodjek/vim-puppet'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', { 'for' : [ 'go' ] , 'do': ':GoInstallBinaries'} 
Plug 'rust-lang/rust.vim', { 'for' :  'rust' }
Plug 'racer-rust/vim-racer', { 'for' : 'rust' }
Plug 'slim-template/vim-slim', {
                        \       'for' : ['ruby' ],
                        \}
Plug 'vim-scripts/ruby-matchit',  {'for' : 'ruby'}

Plug 'vim-php/tagbar-phpctags.vim', { 
                        \       'for' : 'php',
                        \       'dir': '~/.vim/plugged/tagbar-phpctags.vim/',
                        \       'do': 'make'
                        \       }
Plug 'nbouscal/vim-stylish-haskell',{
                        \   'for' : [ 'haskell' ] ,
                        \ }
Plug 'neomake/neomake',{
                        \   'for' : [ 'haskell' ] ,
                        \ }
Plug 'eagletmt/ghcmod-vim',{
                        \   'for' : [ 'haskell' ] ,
                        \ }
Plug 'dag/vim2hs', {
                        \   'for' : [ 'haskell' ] ,
                        \ }

Plug 'Twinside/vim-hoogle',{
                        \   'for' : [ 'haskell' ] ,
                        \ }

Plug 'eagletmt/neco-ghc', {
                        \   'for' : [ 'haskell' ] ,
                        \ }
Plug 'dan-t/vim-hsimport', {
                        \   'for' : [ 'haskell' ] ,
                        \ }


Plug 'rgrinberg/vim-ocaml', {
                        \       'for' : 'ocaml',
                        \ }

Plug 'pbrisbin/vim-syntax-shakespeare',{
                        \   'for' : [ 'hamlet', 'cassius', 'lucius', 'julius' ] ,
                        \ }
"erlang
Plug 'vim-erlang/vim-erlang-runtime', {
                        \       'for' : 'erlang' ,
                        \ }
" erlangのオムニ補完
Plug 'vim-erlang/vim-erlang-omnicomplete', {
                        \       'for' : 'erlang' ,
                        \ }

"clojure
Plug 'guns/vim-clojure-static', {
                        \       'for' : [ 'clojure' ],
                        \}

Plug 'tpope/vim-fireplace', {
                        \       'for' : [ 'clojure' ],
                        \ }
Plug 'OmniSharp/omnisharp-vim', {
                        \       'for' : [ 'csharp' ],
                        \ }
Plug 'kongo2002/fsharp-vim', {
                        \       'for' : 'fsharp',
                        \ }
Plug 'zah/nimrod.vim', {
                        \       'for' : 'nim',
                        \ }
Plug 'leafgarland/typescript-vim',{
                        \       'for' : ['typescript'],
                        \ }
Plug 'Quramy/tsuquyomi', {
                        \       'for': ['typescript', 'javascript'],
                        \ }
Plug 'jdonaldson/vaxe',{
                        \       'for' : ['haxe']
                        \}
Plug 'MarcWeber/vim-haxe-syntax',{
                        \       'for' : ['haxe'],
                        \}
Plug 'ternjs/tern_for_vim', {
                        \       'for': 'javascript',
                        \ }
Plug 'hushicai/tagbar-javascript.vim', {
                        \       'for' : 'javascript',
                        \       'do': 'npm i -g esctags',
                        \}
Plug 'pangloss/vim-javascript',{
                        \       'for' : 'javascript',
                        \}
Plug 'maksimr/vim-jsbeautify' ,{
                        \       'for' : 'javascript',
                        \}
Plug 'keith/swift.vim', {
                        \        'for' : 'swift',
                        \ }
Plug 'elzr/vim-json',{
                        \       'for' : [ 'json' ],
                        \}
"Plug 'pearofducks/ansible-vim', {
"                        \       'for' : [ 'ansible.yaml' ],
"                        \       'do': 'cd ./UltiSnips; ./generate.py' ,
"                        \}
Plug 'pld-linux/vim-syntax-vcl',{
                        \       'for' : [ 'vcl' ],
                        \}
Plug 'smerrill/vcl-vim-plugin',{
                        \       'for' : [ 'vcl' ],
                        \}

Plug 'jvoorhis/coq.vim', {
                        \   'for' : [ 'coq' ],
                        \ }
Plug 'keith/swift.vim', {
                        \   'for' : [ 'swift' ],
                        \ }
Plug 'udalov/kotlin-vim'

call plug#end()
