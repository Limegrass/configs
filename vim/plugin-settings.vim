"   Sections:
"       VIM_PLUG
"       PLUGIN_SETTINGS
" ==============================================================================
" VIM_PLUG
" ==============================================================================

if empty(glob($VIMDIR.'/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin($VIMDIR.'/plugged')

" Editing/Core
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-obsession'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'previm/previm', {'for': ['markdown']}
    Plug 'tyru/open-browser.vim'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug 'qpkorr/vim-bufkill'
" Appearances
Plug 'flazz/vim-colorschemes'
Plug 'aonemd/kuroi.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline-themes'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'
" Plug 'rickhowe/diffchar.vim'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" if !nvim !yarn global add vim-node-rpc
Plug 'OmniSharp/omnisharp-vim'

" Syntax
Plug 'PProvost/vim-ps1'
Plug 'OrangeT/vim-csharp', {'for': ['cs']}
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['cs', 'html', 'cshtml', 'scss', 'css']}
Plug 'mhartington/nvim-typescript', {'for': ['ts']}
call plug#end()

" ==============================================================================
" PLUGIN_SETTINGS
" ==============================================================================

let g:indent_guides_enable_on_vim_startup = 0

let g:taboo_tab_format=' %N [%f%m] '

let g:airline_theme='deus'

let g:gundo_prefer_python3 = 1

" fzf-vim
let g:fzf_layout = { 'right' : '20%'}

" ncm-clang
let g:clang_make_default_keymappings = 0
let g:clang_auto_user_options = ''

" vimtex
let g:vimtex_view_general_viewer  = 'SumatraPDF'
let g:vimtex_view_general_options =
            \'-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Previm
let g:previm_enable_realtime = 0

let g:BufKillCreateMappings = 0

" Ultisnips with ncm
let g:UltiSnipsJumpForwardTrigger  = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<nop>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" incsearch/fuzzy
let g:incsearch#auto_nohlsearch = 1

source $GITVIMDIR\cocrc.vim
source $GITVIMDIR\omnisharp.vim
