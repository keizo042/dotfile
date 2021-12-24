let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0

let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
    \ 'go': 'vim_lsp',
    \ 'python': 'vim_lsp',
    \ }

nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>
