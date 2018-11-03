" Base example for myself
" ==============================================================================
" Rebind in individual machine vimrcs
" ==============================================================================
" Default Location if desired (Otherwise opens in home directory)
if has('win32')
  cd C:\Vim\misc<CR>
endif

" Change directory to Git/Text folder
nnoremap <leader>f :cd C:/Vim/misc<CR>
nnoremap <leader>F :cd C:/Git<CR>

" let g:dbext_default_type = 'SQLSRV'
" let g:dbext_default_integratedlogin = 1
" let g:dbext_default_history_file = 'C:\Vim\dbext_history.txt'

" ==============================================================================
" Worthless usage notes to myself
" ==============================================================================
" Single quotes '' denotes literal strings
" Double quotes "" can use escape characters
" (ex s/%Vx/d/g) would replace x's with d's only in the " visual selection
"
" ALE uses location list for errors list, :lopen
" As a Windows launch option to open in new window --remote-tab-silent
