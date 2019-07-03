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

" Core
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'
" Editing/Core
Plug 'tpope/vim-fugitive'
" Seems DBExt actually works on nvim
" Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-scriptease'
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tyru/open-browser.vim'
    Plug 'previm/previm', {'for': ['markdown'], 'on': ['PrevimOpen']}
" Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug 'kshenoy/vim-signature'
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'jupyter-vim/jupyter-vim'
" Plug 'rickhowe/diffchar.vim'

" Appearances
Plug 'flazz/vim-colorschemes'
Plug 'aonemd/kuroi.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides', {'on': ['IndentGuidesEnable', 'IndentGuidesToggle']}
Plug 'vim-airline/vim-airline-themes'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" if !nvim !yarn global add vim-node-rpc
Plug 'OmniSharp/omnisharp-vim'

" Syntax
Plug 'PProvost/vim-ps1'
Plug 'OrangeT/vim-csharp', {'for': ['cs']}
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['cs', 'html', 'cshtml', 'scss', 'css']}
Plug 'mhartington/nvim-typescript', {'for': ['ts']}

" Pair programming, check if they're usable when needed.
" Plug 'Floobits/floobits-vim'
" Plug 'FredKSchott/CoVim'
call plug#end()

" ==============================================================================
" PLUGIN_SETTINGS
" ==============================================================================

let g:indent_guides_enable_on_vim_startup = 0

let g:taboo_tab_format=' %N [%f%m] '

let g:airline_theme='deus'

let g:gundo_prefer_python3 = 1

" fzf-vim
let g:fzf_layout = { 'down' : '20%'}

" vim-signature
let g:SignatureEnabledAtStartup = 0

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

" vim-bufkill
let g:BufKillCreateMappings = 0

" Ultisnips
let g:UltiSnipsExpandTrigger  = "<NUL>"
let g:UltiSnipsJumpForwardTrigger  = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
let g:UltiSnipsRemoveSelectModeMappings = 0
xnoremap <TAB> :call UltiSnips#SaveLastVisualSelection()<CR>gvs

" incsearch/fuzzy
let g:incsearch#auto_nohlsearch = 1

colorscheme kuroi " alt: corporation, hybrid, zenburn

augroup commentary
    autocmd!
    autocmd FileType sql setlocal commentstring=--\ %s
augroup END

" jupyter-vim
let g:jupyter_mapkeys = 0
nnoremap <leader>EJ :JupyterRunFile<CR>
nnoremap <leader>I :JupterImportThisFile<CR>
nnoremap <leader>ej :JupyterSendCell<CR>
vnoremap <leader>ej :JupyterSendRange<CR>

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


source $GITVIMDIR\cocrc.vim
source $GITVIMDIR\omnisharp.vim
