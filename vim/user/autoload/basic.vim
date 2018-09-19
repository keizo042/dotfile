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
let g:incsearch#auto_nohlsearch=0
let g:hpaste_author = 'keizo'
let g:sonictemplate_vim_template_dir=expand("~/.vim/templates")
call watchdogs#setup(g:quickrun_config)

"" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1


function! s:InstallRustEnv()
    if !isdirectory(expand("~/bin/racer"))
    system("git clone https://github.com/phildawes/racer.git ~/bin/racer")
    system("cd ~/bin/racer;cargo build --release")
    endif
endfunction

if isdirectory(expand("./.stack-work")) || filereadable(expand("./Setup.hs")) 
  runtime user/languages/haskell.vim
endif

augroup ftpsetting
        autocmd!
        autocmd! FileType * setlocal formatoptions-=ro
        autocmd! BufNewFile,BufRead *.ts setf typescript
        autocmd  BufNewFile,BufRead *.vcl setf vcl
        autocmd  BufNewFile,BufRead *.dig setf yaml
        autocmd! BufNewFile,BufRead *.erl setf erlang
        autocmd! BufNewFile,BufRead *.scala setfiletype scala 
        autocmd! BufNewFile,BufRead *vim* setfiletype VIM 
        autocmd! BufNewFile,BufRead *.clj setfiletype clojure
        autocmd! BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=MARKDOWN
        autocmd! BufNewfile,BufRead *.gembox setfiletype RUBY
        autocmd! BufNewFile,BufRead *.hx setfiletype HAXE
        autocmd! BufNewFile,BufRead *.swift setfiletype swift
        autocmd! FileType erlang setlocal makeprg=erlc\ %
        autocmd! FileType erlang setlocal errorformat=%f:%l:\ %m
        autocmd! BufNewFile,BufRead *.go nnoremap <C-n> <C-x><C-o>
augroup END

augroup GoSettings
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
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




augroup HaskellKeymap
    autocmd!
    autocmd FileType haskell nmap <silent> <C-n>  :GhcModType<CR>
    autocmd FileType haskell nmap <silent> <C-x> :GhcModTypeInsert<CR>
"    autocmd BufWritePost *.hs GhcModCheck
    autocmd FileType haskell command! W GhcModCheck
augroup End

augroup CoqKeyMap
    autocmd! 
    au FileType coq call coquille#CoqideMapping()
    autocmd FileType coq nmap <LocalLeader>s :CoqStart<CR>
augroup End

augroup JS
    autocmd FileType javascript  noremap <buffer>  <c-g> :call JsBeautify()<cr>
augroup End

augroup Go
  autocmd FileType go noremap <buffer> <c-g> :GoMetaLinter<cr>
augroup END

"command! -buffer -nargs=+ -complete=customlist,s:completePackage ImportAll call s:wrapImportAll(<f-args>)
"command! -buffer -nargs=* -complete=customlist,s:completePackage ImportAsAll call s:WrapImportAsAll( <f-args>)
"command! Goimports  echo system("go list -f '{{ join .Imports \"\n\" }}'" .   expand("%:p"))



