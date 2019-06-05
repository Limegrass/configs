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
nnoremap <silent> <C-SPACE>          :Buffers<CR>
nnoremap <silent> <C-SPACE><C-SPACE> :FZF<CR>
nnoremap <silent> <C-SPACE>f :FZF <C-R><C-W><CR>
nnoremap <silent> <C-SPACE>F :FZF <C-R><C-A><CR>
nnoremap <silent> <C-SPACE>r :Rg <C-R><C-W><CR>
nnoremap <silent> <C-SPACE>R :Rg <C-R><C-A><CR>


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
nmap z/ <Plug>(incsearch-fuzzy-/)
nmap z? <Plug>(incsearch-fuzzy-?)
nmap zg/ <Plug>(incsearch-fuzzy-stay)
nmap <leader>/ <Plug>(incsearch-fuzzyspell-/)
nmap <leader>? <Plug>(incsearch-fuzzyspell-?)
nmap <leader>g/ <Plug>(incsearch-fuzzyspell-stay)

inoremap <silent> <C-J> <C-R>=<SID>UltiJumpOrKey("\<lt>C-J>")<CR>
snoremap <silent> <C-J> <C-O>:call UltiSnips#JumpForwards()<CR>

function! s:UltiJumpOrKey(key)
    let g:ulti_jump_forwards_res = 0
    call UltiSnips#JumpForwards()
    if g:ulti_jump_forwards_res
        return ""
    else
        return a:key
    endif
endfunction

inoremap <silent> <C-K> <C-R>=<SID>UltiJumpBackOrKey("\<lt>C-K>")<CR>
snoremap <silent> <C-K> <C-O>:call UltiSnips#JumpBackwards()<CR>
function! s:UltiJumpBackOrKey(key)
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
xnoremap <expr> j  mode() ==# "v" ? "gj" : "j"
xnoremap <expr> gj mode() ==# "v" ? "j"  : "gj"
xnoremap <expr> k  mode() ==# "v" ? "gk" : "k"
xnoremap <expr> gk mode() ==# "v" ? "k"  : "gk"
inoremap <expr> <UP>   pumvisible() ? "\<C-P>" : "\<C-O>gk"
inoremap <expr> <DOWN> pumvisible() ? "\<C-N>" : "\<C-O>gj"

" =============================== NORMAL_MODE ==================================
if has("win32") || has ("win32unix")
    noremap <C-Z> <NOP>
endif
nnoremap <silent> <leader>v :execute 'edit $VIMRC \| setlocal fileformat=unix'<CR>
nnoremap <silent> <leader>V :execute 'vnew $VIMRC \| setlocal fileformat=unix'<CR>
nnoremap <silent> <leader>S :source $MYVIMRC<CR>
nnoremap <silent> <ESC> :nohlsearch<CR><ESC>

nnoremap Q @q " Ex mode by gQ still

nnoremap Y y$
nnoremap <leader>= "+
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap "" "+
nnoremap """ "_
nnoremap <leader>w :w<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bq :q<CR>

nnoremap <silent> ZW :w<CR>
nnoremap <silent> ZB :buffers<CR>:b
nnoremap <silent> ZX :bd<CR>
nnoremap <silent> ZD :BD<CR>

nnoremap <expr> yr CopyRegisterFromInto(nr2char(getchar()), nr2char(getchar()))

" Search for word currently under cursor
nnoremap // yiw/<C-R>"

"TODO: Create a better mapping (and function itself) for splitting (cm) and aligning
nnoremap cm :silent call SplitCommas()<CR>
function! SplitCommas()
    s/,\s*/,\r/ge
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

" Reciprocal of {count}gT
nnoremap <silent> <leader>gt :<C-U>execute 'normal '.repeat("gt", v:count1)<CR>
" Change working directory to current file
nnoremap <silent> <leader>cd :lcd %:p:h<CR>
" Open file explorer on current file location
if has('win32')
    nnoremap <leader>e :silent !explorer.exe %:p:h<CR>
endif
" Navigate out of terminal mode
if has('nvim')
    tnoremap <ESC> <C-\><C-N>
endif

nnoremap <silent> <C-W>V :vnew<CR>
" :new
nnoremap <C-W>S <C-W>n
" New tab starting in the same location as default
nnoremap <silent> <C-W><C-T> :tabedit \| lcd $GARBAGEDIR<CR>
" Delete all buffers of current tab
nnoremap <silent> <C-W>C :windo bd<CR>
" vsplit of <C-W>f
nnoremap <C-W><C-F> <C-W>vgf

nnoremap <silent> <leader>j :call JoinSpaceless()<CR>
nnoremap <silent> <leader>J :call JoinSpaceless()<CR>

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
xnoremap <leader>d "+d
xnoremap . :normal .<CR>

xnoremap <leader>x "xy:<C-R>x<CR>

" Search for visual selected
xnoremap // y/<C-R>"<CR>

" =============================== INSERT_MODE ==================================
" CTRL+BS/DEL like other editors
inoremap <C-BS> <C-W>
cnoremap <C-BS> <C-W>
inoremap <C-DEL> <C-O>dw
" cnoremap <C-DEL> <C-O>dw Fix this

inoremap <C-R><C-S> <C-R>+
inoremap <C-R><C-E> <C-R>0
inoremap <C-R><C-T> <C-R>"
cnoremap <C-R><C-S> <C-R>+
cnoremap <C-R><C-E> <C-R>0
cnoremap <C-R><C-T> <C-R>"

inoremap <silent> <TAB> <C-R>=<SID>TabOrComplete()<CR>
function! s:TabOrComplete()
    if pumvisible()
        if empty(v:completed_item)
            return "\<C-n>\<C-y>"
        else
            return "\<C-y>"
        endif
    else
        return "\<TAB>"
    endif
endfunction


" =============================== COMMANDS =====================================
" Function shortcuts
command! -nargs=* -range Retab <line1>,<line2>call Retab(<f-args>)
command! -nargs=0 StripTrailingWhiteSpace call Preserve('%s/\s\+$//e') | call Preserve('%s/\($\n\s*\)\+\%$//e')
command! -nargs=0 Reindent call Preserve('normal gg=G')
command! -nargs=0 Clipboard call Preserve('normal gg"+yG')
command! -nargs=1 ClearRegister call ClearRegister(<q-args>)
command! -nargs=+ CopyRegisterFromInto call CopyRegisterFromInto(<f-args>)
command! -nargs=* Google call StartBrowser('https://google.com/search?q='.<q-args>)
if has('gui')
    command! -complete=file -nargs=* LoadBuffer silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"
endif

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

command! -nargs=0 DeleteEmptyBuffers silent call DeleteEmptyBuffers()

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
call CommandAbbreviations('vh', 'vert help')
call CommandAbbreviations('bs', 'buffers<CR>:b')
call CommandAbbreviations('bds', 'buffers<CR>:bd')
call CommandAbbreviations('help', 'vert help')
call CommandAbbreviations('doff', 'diffoff')
call CommandAbbreviations('dt', 'diffthis')
call CommandAbbreviations('vb', 'vert sb')
call CommandAbbreviations('vsb', 'vert sb')
call CommandAbbreviations('H', 'helpgrep')
call CommandAbbreviations('bdall', '%bd\|e#')
