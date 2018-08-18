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

let $VSVIMRC = 'C:/Users/james.ni/_vsvimrc'

" ==============================================================================
" Worthless usage notes to myself
" ==============================================================================
" Single quotes '' denotes literal strings
" Double quotes "" can use escape characters
" (ex s/%Vx/d/g) would replace x's with d's only in the " visual selection
" :e **/{FILENAME} to access a file in any subfolder
"
" REGISTERS
" <Ctrl-R> {REGISTER} to access a register in insert
" "{REGISTER} in normal mode
" . register is the last inserted text
" % is current file path
" : is last command
" + is the clipboard
" Number registers are the last few deleted texts
" @{REGISTER} can be used to execute commands in those registers
"
" ALE uses location list for errors list, :lopen
