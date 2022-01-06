let g:lsp_log_verbose = 0
let g:lsp_log_file = ""
let g:lsp_diagnostics_echo_cursor = 1
augroup MyLsp
  autocmd!
  " pip install python-language-server
  if executable('pyls')
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': { server_info -> ['pyls'] },
        \ 'whitelist': ['python'],
        \})
  endif
augroup END
