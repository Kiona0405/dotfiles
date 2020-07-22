function! myspacevim#after() abort
  let g:mapleader = ","
  set timeoutlen=100
  set wrap
  let g:winresizer_start_key = '<C-T>'
  let g:vimfiler_ignore_pattern = ''

  let g:neomake_python_flake8_maker = {
      \ 'args': ['--ignore=E402',  '--format=default'],
      \ }
  let g:neomake_python_enabled_makers = ['flake8']

endfunction
