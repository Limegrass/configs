" TODO: See if I can register Omnisharp
" CocInstall coc-dictionary coc-tag coc-omni coc-syntax coc-ultisnips
" CocInstall coc-json coc-vimtex coc-pyls coc-java coc-highlight coc-html coc-yank
" CocInstall coc-vimlsp coc-lists

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use <c-space> for trigger completion.
inoremap <silent> <expr> <c-space> pumvisible() ? "\<C-X>\<CR>" : coc#refresh()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <SID>CocActionOrDefault('[c', 'diagnosticPrevious')
nmap <silent> ]c <SID>CocActionOrDefault(']c', 'diagnosticNext')

" Remap keys for gotos
nmap <silent> gd <SID>CocActionOrDefault('gd', 'jumpDefinition')
nmap <silent> gy <SID>CocActionOrDefault('gy', 'jumpTypeDefinition')
nmap <silent> gi <SID>CocActionOrDefault('gi', 'jumpImplementation')
nmap <silent> gr <SID>CocActionOrDefault('gr', 'jumpReferences')

" Use K for show documentation in preview window
" Currently broken and breaks K in help, need to fix.
nnoremap <expr> K index(['vim', 'help'], &filetype) >= 0 ? 'K' : <SID>CocActionOrDefault('K', 'doHover')

function! s:CocActionOrDefault(default_action, coc_action)
    if !CocActionAsync(a:coc_action)
        return a:default_action
    endif
    return ''
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call   CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
