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
set tags=tags;/,codex.tags;/



"set cursorline
"set cursorcolumn
set wildmenu
set wildmode=longest:full,full

let g:tsuquyomi_javascript_support=1
let mapleader = ","
"tab
set smartindent
set autoindent
set shiftwidth=2
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
set maxmempattern=8000

noremap \ ,
"set foldmethod=syntax

" ctrlp.vim
let g:ctrlp_use_caching=0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
if executable('fzf')
  let g:fz_command = 'fzf'
  let g:fz_command_files = ''
  let g:fz_command_options_action = '--expect=%s'
  let g:ctrlp_map = ''
  nnoremap <silent> <C-p> :call fz#run({ 'type': 'cmd', 'cmd': 'git ls-files' })<CR>
endif

"ack.vim
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
