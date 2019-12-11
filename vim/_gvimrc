set guioptions=c
set guifont=Consolas:h9
let &lines=999
let &columns=999
command! -complete=file -nargs=* LoadBuffer silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"
