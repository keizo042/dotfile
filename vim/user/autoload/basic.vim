if !exists('loaded_matchit')
      " matchitを有効化
        runtime macros/matchit.vim
endif

"plugin env variable
set rtp+=~/.vim/plugged/vital.vim
let s:Vital = vital#of('vital')
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:go_metalinter_autosave = 0
"let g:go_fmt_command = "golint"
let g:terraform_fmt_on_save = 0
let g:go_metalinter_command="--min-confidence=1.0"

"config
let g:watchdogs_check_BufWritePost_enable = 0
let g:hpaste_author = 'keizo'
let g:sonictemplate_vim_template_dir=expand("~/.vim/templates")
call watchdogs#setup(g:quickrun_config)

if isdirectory(expand("./.stack-work")) || filereadable(expand("./Setup.hs")) 
  runtime user/languages/haskell.vim
endif
