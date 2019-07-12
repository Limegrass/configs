"   Sections:
"       BASIC_SETTINGS
"       AUTOCOMMANDS
"       VARIABLE_DEFINITIONS
let mapleader="\<SPACE>"
nnoremap <SPACE> <NOP>

" ==============================================================================
" BASIC_SETTINGS
" ==============================================================================
if !has('nvim')
    set diffexpr=GvimDiff()
else
    set lazyredraw
    set inccommand=split
endif

filetype plugin on
set ruler
set incsearch
set ignorecase
set smartcase
set number
set wrap
set wildmenu
set guioptions=c
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:·
set backspace=indent,eol,start
set scrolljump=3
set list
set selection=inclusive
set undofile
set history=100
set cursorline
set hidden
set diffopt+=vertical,iwhite
set fileformats=unix,dos
set fileignorecase
set virtualedit=all
set nostartofline
set spelllang=en
set mouse=nicr
set splitright
set splitbelow
set foldmethod=indent
set foldlevel=99
" set sessionoptions+=tabpages,globals
set completeopt=noinsert,menuone,noselect
runtime macros/matchit.vim
let g:omni_sql_no_default_maps = 1
" INDENT SETTINGS
set expandtab
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=-1
" Character limit highlight
call matchadd('ColorColumn', '\%81v.', 100)
" Prevent starting in Hiragana
set iminsert=0
set imsearch=-1
if has('pythonx')
    if has('python3')
        set pyx=3
    elseif has('python')
        set pyx=2
    endif
endif

" Put undo/swap/temp files user's vim subfolder
let $UNDODIR=$VIMDIR.'/undo'
if !isdirectory($UNDODIR)
    silent call mkdir($UNDODIR)
endif
set undodir=$UNDODIR

let $BACKUPDIR=$VIMDIR.'/backup'
if !isdirectory($BACKUPDIR)
    silent call mkdir($BACKUPDIR)
endif
set backupdir=$BACKUPDIR

let $SWAPDIR=$VIMDIR.'/swap'
if !isdirectory($SWAPDIR)
    silent call mkdir($SWAPDIR)
endif
set directory=$SWAPDIR

set termguicolors
set background=dark
set guifont=Consolas:h9
if has('gui_running')
    let &lines=999
    let &columns=999
endif

" ==============================================================================
" AUTOCOMMANDS
" ==============================================================================
" QuickFix window on vimgrep
if has('autocmd')
    augroup QuickFix
        autocmd!
        autocmd CmdwinEnter * nnoremap <CR> <CR>
        autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    augroup END

    " Set spellchecking on for text buffers
    augroup Spell
        autocmd!
        autocmd Filetype text setlocal spell
        autocmd Filetype help setlocal nospell
    augroup END

    " Autocompletion for HTML tags
    augroup Html
        autocmd!
        autocmd Filetype html,xml,markdown inoremap <buffer> </ </<C-X><C-O>
    augroup END

    augroup PrevimSettings
        autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    augroup END
    augroup CSharp
        autocmd!
        autocmd BufReadPost *.{cs} silent call TFCheckout()
    augroup END
endif

" ==============================================================================
" VARIABLE_DEFINITIONS
" ==============================================================================
let g:guid_regex = '[a-zA-Z0-9]\{8,8}-[a-zA-Z0-9]\{4,4}-'
            \ .'[a-zA-Z0-9]\{4,4}-[a-zA-Z0-9]\{4,4}-[a-zA-Z0-9]\{12,12}'
