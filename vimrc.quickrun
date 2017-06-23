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



