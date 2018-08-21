" Base example for myself
" ==============================================================================
" Rebind in individual machine vimrcs
" ==============================================================================
" Default Location if desired (Otherwise opens in home directory)
if has('win32')
  cd C:/Users/james.ni/Documents/Vim
endif

" Edit vimrc. Symlink it to the configs folder
nnoremap <leader>v :edit $MYVIMRC<CR> :lc %:h<CR>
nnoremap <leader>V :tabnew $MYVIMRC<CR> :lc %:h<CR>

" Change directory to Git/Text folder
nnoremap <leader>f :cd C:/Users/james.ni/Documents/Vim<CR>
nnoremap <leader>F :cd C:/Git<CR>
nnoremap <leader>ya :call Preserve('normal gg"+yG')<CR>

let $VSVIMRC = 'C:/Users/james.ni/_vsvimrc'

" ==============================================================================
" Worthless usage notes to myself
" ==============================================================================
" Single quotes '' denotes literal strings
" Double quotes "" can use escape characters
" (ex s/%Vx/d/g) would replace x's with d's only in the " visual selection
"
" ALE uses location list for errors list, :lopen
" As a Windows launch option to open in new window --remote-tab-silent
