"   Sections:
"       ALL_MODES
"       NORMAL_MODE
"       VISUAL_MODE
"       INSERT_MODE
"       COMMANDS
"       ABBREVIATIONS
" ================================ ALL_MODES ===================================
let mapleader="\<SPACE>"
nnoremap <SPACE> <NOP>
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
if IsWindows()
    noremap <C-Z> <NOP>
endif
nnoremap <silent> <leader>v :edit $MYVIMRC<CR>
nnoremap <silent> <leader>V :vnew $MYVIMRC<CR>
nnoremap <silent> <leader>S :source $MYVIMRC<CR>
nnoremap <silent> <ESC> :nohlsearch<CR><ESC>

nnoremap Q @q " Ex mode by gQ still

nnoremap Y y$
nnoremap <leader>" "+
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <silent> y+ :silent %y +<CR>
nnoremap yp :1,$d\|0 put +<CR>
nnoremap "" "+
nnoremap """ "_
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bq :q<CR>
nnoremap <silent> <leader>ss :set spell!<CR>

nnoremap <silent> ZW :w<CR>
nnoremap <silent> ZB :buffers<CR>:
nnoremap <silent> ZX :bd<CR>
nnoremap <silent> ZD :BD<CR>

nnoremap <silent> cx :call StripExtraneousWhiteSpace()<CR>

nnoremap <M-/> gv<C-]>

nnoremap <expr> yr CopyRegisterFromInto(GetCharInput(), GetCharInput())

"TODO: Create a better mapping (and function itself) for splitting (cm) and aligning
nnoremap <silent> cm :silent call SplitCommas()<CR>
function! SplitCommas()
    s/,\s*/,\r/ge
    retab
endfunction

nnoremap <silent> c> :call IndentAlign()<CR>
function! IndentAlign()
    let l:charAlignedUnder = input('Align under: ')
    if empty(l:charAlignedUnder)
        return
    endif
    let l:prefix = input('Prefix: ')
    if l:prefix
        let l:prefix = '\('.l:prefix.'\)'.'\@<='
    endif
    let l:lineWithMatch = search(l:prefix.l:charAlignedUnder, 'nb')
    let l:terminateAt = input('Terminate at: ')
    if l:terminateAt
        let l:terminationLine = search(l:terminateAt, 'n')
    else
        let l:terminationLine = getcurpos()[1]
    endif
    let l:charIndex = matchstrpos(getline(l:lineWithMatch), l:charAlignedUnder)[1]
    let l:whitespace = repeat(' ', l:charIndex)
    if l:lineWithMatch + 1 < l:terminationLine
        execute (l:lineWithMatch+1).','.l:terminationLine.'s/^\s*/'.l:whitespace.'/'
    endif
endfunction

nnoremap <silent> >( :silent call AlignToCharInPreviousLine('(')<CR>
nnoremap <silent> >" :silent call AlignToCharInPreviousLine('"')<CR>
nnoremap <silent> >' :silent call AlignToCharInPreviousLine("'")<CR>
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
if IsWindows()
    nnoremap <leader>ee :silent !explorer.exe %:p:h<CR>
endif
" Navigate out of terminal mode
if has('nvim') || has('terminal')
    tnoremap <ESC><ESC> <C-\><C-N>
endif

" :new
nnoremap <C-W>S <C-W>n
" New tab starting in the same location as default
nnoremap <silent> <C-W><C-T> :tabedit<CR>
" Delete all buffers of current tab
nnoremap <silent> <C-W>C :windo bd<CR>
" vsplit of <C-W>f
nnoremap <C-W><C-F> <C-W>vgf
nnoremap <silent> <C-W><C-E> :enew<CR>
nnoremap <silent> <C-W>V :vnew<CR>
nnoremap <silent> <C-W><CR> :vs \| terminal<CR>

nnoremap <silent> <leader>j :call <SID>JoinSpaceless()<CR>
nnoremap <silent> <leader>J :call <SID>JoinSpaceless()<CR>
function! s:JoinSpaceless()
    execute 'normal gJ'
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        execute 'normal dw'
    endif
endfunction
nnoremap <silent> <leader><C-W> :call <SID>GoToFloatingWindow()<CR>
function! s:GoToFloatingWindow()
    let l:floatingWindowNumber = GetFloatingWindowNumber()
    if (l:floatingWindowNumber == v:null)
        let l:floatingWindowNumber = ''
    endif
    execute l:floatingWindowNumber.' wincmd w'
endfunction

" =============================== VISUAL_MODE ==================================
" Retain selection when indenting in visual mode
xnoremap > >gv
xnoremap < <gv
xnoremap <leader>= "+
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xnoremap <leader>y "+y
xnoremap <leader>d "+d
xnoremap . :normal .<CR>
xnoremap <leader>m c<C-R>=<C-R>"<CR>

xnoremap <leader>x "xy:<C-R>x<CR>

" Search for visual selected
xnoremap // y/<C-R>"<CR>

" Yank last visual selection to v
xnoremap : "vygv:

" =============================== INSERT_MODE ==================================
" Reduces my reliance on having a split spacebar keyboard
inoremap jj <ESC>
" CTRL+BS/DEL like other editors
inoremap <C-BS> <C-W>
cnoremap <C-BS> <C-W>
inoremap <C-DEL> <C-O>dw
" cnoremap <C-DEL> <C-O>dw Fix this
inoremap <C-L> <C-G>u<ESC>[s1z=`]a<C-G>u

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
command! -nargs=0 StripTrailingWhiteSpace call StripExtraneousWhiteSpace()
command! -nargs=0 Reindent call Preserve('normal gg=G')
command! -nargs=1 ClearRegister call ClearRegister(<q-args>)
command! -nargs=+ CopyRegisterFromInto call CopyRegisterFromInto(<f-args>)
command! -nargs=* Google call StartBrowser('https://google.com/search?q='.<q-args>)

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
command! -nargs=0 DeleteSavedBuffers silent call DeleteSavedBuffers()

command! -nargs=1 SplitLines call SplitLines(<f-args>)
function! SplitLines(delimiter)
    let l:cmd = 's/'.a:delimiter.'/\r/g'
    execute l:cmd
endfunction

command! TogglePrevimLive call ToggleBool('g:previm_enable_realtime')
command! TFCheckout call TFCheckout()

command! BrowseOld call <SID>BrowseOld()
function! s:BrowseOld() abort
    enew
    setlocal buftype=nofile
    0put =v:oldfiles
    1
    nnoremap <buffer> <silent> <CR> :silent call <SID>GoToFileAndClose()<CR>
endfunction
function! s:GoToFileAndClose() abort
    let l:buffer_number = bufnr('%')
    e <cfile>
    execute 'bd '.l:buffer_number
endfunction

" Sudo write
command! -nargs=1 Sudo call Sudo(<q-args>)
if !IsWindows()
    command! -nargs=0 Sw w !sudo tee % > /dev/null
endif

command! -nargs=1 -complete=dir Mkdir call mkdir(<q-args>)

" =============================== ABBREVIATIONS ================================
" Force vertical splits for help files and expand gui window for help
call CommandAbbreviations('vh', 'vert help')
call CommandAbbreviations('bs', 'buffers<CR>:')
call CommandAbbreviations('help', 'vert help')
call CommandAbbreviations('doff', 'diffoff')
call CommandAbbreviations('dt', 'diffthis')
call CommandAbbreviations('vb', 'vert sb')
call CommandAbbreviations('vsb', 'vert sb')
call CommandAbbreviations('H', 'helpgrep')
call CommandAbbreviations('bdall', '%bd\|e#')
