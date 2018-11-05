let g:tab_seted =0
function! s:TabSizeDefine(tab_size)
        let g:tab_seted=1
        if a:tab_size != 0
                let &l:shiftwidth=a:tab_size
                let &l:softtabstop=a:tab_size
        else
                let &l:shiftwidth=4
                let &l:softtabstop=4
        end
endfunction

function! s:TabHardDefine()
        let g:tab_seted=1
        setlocal noexpandtab
endfunction

if g:tab_seted !=1
        call s:TabSizeDefine(2)
endif
augroup LanguageSettings
        autocmd!
        autocmd! BufNewFile,BufRead *.lua,*.yml,*.yaml,*.cabal,*.html,*.cc,*.cpp,*.cxx,*.xx,*.tmlp,*.rb,*.hs,*.ml,*.scala call s:TabSizeDefine(2)
        autocmd! BufNewFile,BufRead *.py,*.c,*.ts,*.cxx,*.hx,*.d, call s:TabSizeDefine(4)
augroup END
