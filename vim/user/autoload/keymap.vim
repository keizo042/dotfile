
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

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gn         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
