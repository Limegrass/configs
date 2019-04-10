"   Sections:
"       PLUGINS
"       ALL_MODES
"       NORMAL_MODE
"       VISUAL_MODE
"       INSERT_MODE
"       COMMANDS
"       ABBREVIATIONS
" ================================ PLUGINS ===================================
" Vim-commentary bind
nnoremap <leader><Tab> :Commentary<CR>
xnoremap <leader><Tab> :Commentary<CR>

" FZF
nnoremap <C-SPACE>   :Buffers<CR>
nnoremap <C-S-SPACE> :FZF<CR>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" tagbar
nnoremap <F2> :TagbarToggle<CR>

" incsearch/fuzzy rebindings
nmap n  <Plug>(incsearch-nohl-n)
nmap N  <Plug>(incsearch-nohl-N)
nmap *  <Plug>(incsearch-nohl-*)
nmap #  <Plug>(incsearch-nohl-#)
nmap g* <Plug>(incsearch-nohl-g*)
nmap g# <Plug>(incsearch-nohl-g#)
nmap /  <Plug>(incsearch-forward)
nmap ?  <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)
nmap <leader>/ <Plug>(incsearch-fuzzyspell-/)
nmap <leader>? <Plug>(incsearch-fuzzyspell-?)
nmap <leader>g/ <Plug>(incsearch-fuzzyspell-stay)


inoremap <silent> <TAB> <C-R>=CompleteOrJumpOrKey("\<TAB>")<CR>
snoremap <TAB> <C-O>:call UltiSnips#JumpForwards()<CR>
function! CompleteOrJumpOrKey(key)
    if pumvisible()
        return coc#_select_confirm()
    else
        return UltiJumpOrKey(a:key)
    endif
endfunction

function! UltiJumpOrKey(key)
    let g:ulti_jump_forwards_res = 0
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res
        return ""
    else
        return a:key
    endif
endfunction

inoremap <silent> <S-TAB> <C-R>=UltiJumpBackOrKey("\<C-O><<")<CR>
snoremap <silent> <S-TAB> <C-O>:call UltiSnips#JumpBackwards()<CR>
function! UltiJumpBackOrKey(key)
    let g:ulti_jump_backwards_res = 0
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res
        return ""
    else
        return a:key
    endif
endfunction

" ================================ ALL_MODES ===================================
" Remap J, K some to navigate visible lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap $ g$
nnoremap g$ $
nnoremap 0 g0
nnoremap g0 0
xnoremap <expr> j  mode() ==# "v" ? "gj" : "j"
xnoremap <expr> gj mode() ==# "v" ? "j"  : "gj"
xnoremap <expr> k  mode() ==# "v" ? "gk" : "k"
xnoremap <expr> gk mode() ==# "v" ? "k"  : "gk"
inoremap <expr> <UP>   pumvisible() ? "\<C-P>" : "\<C-O>gk"
inoremap <expr> <DOWN> pumvisible() ? "\<C-N>" : "\<C-O>gj"


" ALT+jk to move lines up and down
nnoremap <A-j>      :move .+1<CR>==
nnoremap <A-k>      :move .-2<CR>==
xnoremap <A-j>      :move '>+1<CR>gv=gv
xnoremap <A-k>      :move '<-2<CR>gv=gv
inoremap <A-j> <Esc>:move .+1<CR>==gi
inoremap <A-k> <Esc>:move .-2<CR>==gi

" =============================== NORMAL_MODE ==================================
nnoremap <leader>v :execute 'edit $VIMRC \| setlocal fileformat=unix'<CR>
nnoremap <leader>V :execute 'tabnew $VIMRC \| setlocal fileformat=unix'<CR>
nnoremap <leader>S :source $MYVIMRC<CR>
" HELP Right split
nnoremap K K<C-W>L
nnoremap Q @q
nnoremap <C-W>v :vnew<CR>
nnoremap <C-W>s :new<CR>

nnoremap Y y$
nnoremap <leader>= "+
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap yc "+y

nnoremap + "+
nnoremap <expr> yr CopyRegisterFromInto(nr2char(getchar()), nr2char(getchar()))

" Search for word currently under cursor
nnoremap // yiw/<C-R>"

nnoremap cm :silent call SplitCommas()<CR>
function! SplitCommas()
    s/,\s*/,\r/g
    retab
endfunction

nnoremap >( :silent call AlignToCharInPreviousLine('(')<CR>
nnoremap >" :silent call AlignToCharInPreviousLine('"')<CR>
nnoremap >' :silent call AlignToCharInPreviousLine("'")<CR>
" Aligns beginning of current line to char of previous line
function! AlignToCharInPreviousLine(char)
    let l:prefix = 'normal ^kyf'
    let l:suffix = 'jPv0r '
    exec l:prefix.a:char.l:suffix
endfunction

"TODO: Create a better mapping (and function itself) for splitting (cm) and aligning

" Reciprocal of {count}gT
nnoremap <leader>gt :<C-U>execute 'normal '.repeat("gt", v:count1)<CR>
" Change working directory to current file
nnoremap <leader>cd :cd %:p:h<CR>
" Open file explorer on current file location
if has('win32')
    nnoremap <leader>e :silent !explorer.exe %:p:h<CR>
endif
" Copy file path to system register
nnoremap <leader>fp :let @+=expand("%:p")<CR>
" Navigate out of terminal mode
if has('nvim')
    tnoremap <ESC> <C-\><C-N>
endif
" Remap tag jump to Shift+Ctrl+T, Map Ctrl+T to new tab
nnoremap <S-C-T> <C-T>
nnoremap <C-T> :tabedit<CR>
" Mark TODO as DONE
nnoremap <leader>z :s/TODO/DONE/<CR>
nnoremap <leader>T :vimgrep /TODO/ %<CR>

nnoremap <F4> :bd \| bn<CR>
nnoremap <leader><F4> windo bd<CR>

nnoremap <Leader>J :call JoinSpaceless()<CR>

" =============================== VISUAL_MODE ==================================
" Retain selection when indenting in visual mode
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
xnoremap <leader>= "+
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xnoremap <leader>y "+y
xnoremap . :normal .<CR>

" Search for visual selected
xnoremap // y/<C-R>"<CR>

" =============================== INSERT_MODE ==================================
" CTRL+BS/DEL like other editors
inoremap <C-BS> <C-W>
inoremap <C-DEL> <C-O>dw
inoremap <C-V> <C-O>p
inoremap <C-S-V> <C-V>
" Close popup menu with <S-Space>
" inoremap <expr> <S-SPACE>  pumvisible() ? "\<C-E>" : "\<S-SPACE>"
" Paste from system register with <C-R>r
inoremap <C-R><C-R> <C-R>+
inoremap <C-R><C-E> <C-R>0

" =============================== COMMANDS =====================================
cnoremap <C-BS> <C-W>

" Paste from system register with <C-R>r
cnoremap <C-R><C-R> <C-R>+

" Function shortcuts
command! -nargs=* -range Retab <line1>,<line2>call Retab(<f-args>)
command! -nargs=0 StripTrailingWhiteSpace call Preserve('%s/\s\+$//e') | call Preserve('%s/\($\n\s*\)\+\%$//e')
command! -nargs=0 Reindent call Preserve('normal gg=G')
command! -nargs=0 Clipboard call Preserve('normal gg"+yG')
command! -nargs=1 ClearRegister call ClearRegister(<q-args>)
command! -nargs=+ CopyRegisterFromInto call CopyRegisterFromInto(<f-args>)
command! -nargs=1 Google call StartBrowser('https://google.com/search?q='.<q-args>)

command! -nargs=* -range Jisho call Jisho(<f-args>)
function! Jisho(...) range
    if a:0 > 0
        let l:argsList = a:000
    else
        let l:argsList = split(GetVisualSelection())
    endif
    call RepeatForList("call ".
        \ "StartBrowser('https://jisho.org/search/", "')",
        \ l:argsList)
endfunction


command! -nargs=1 SplitLines call SplitLines(<f-args>)
function! SplitLines(delimiter)
    let l:cmd = 's/'.a:delimiter.'/\r/g'
    execute l:cmd
endfunction

command! -nargs=1 Sudo call Sudo(<q-args>)

" Dealing with my typos
command! W w
command! -bang W w
command! Q q
command! -bang Q q

command! TogglePrevimLive call ToggleBool('g:previm_enable_realtime')

" Sudo write in UNIX
if !has('win32')
    command! -nargs=0 Sw w silent !sudo tee % > /dev/null
endif

" =============================== ABBREVIATIONS ================================
" Force vertical splits for help files and expand gui window for help
call CommandAbbreviations('h', 'vert help')
call CommandAbbreviations('help', 'vert help')
call CommandAbbreviations('hh', 'help')
call CommandAbbreviations('hhelp', 'help')
call CommandAbbreviations('doff', 'diffoff')
call CommandAbbreviations('dt', 'diffthis')
call CommandAbbreviations('vb', 'vert sb')
call CommandAbbreviations('H', 'helpgrep')
call CommandAbbreviations('bdall', '%bd\|e#')
call CommandAbbreviations('bd', 'BD')
