
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
