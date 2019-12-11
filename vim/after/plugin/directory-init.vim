if !get(s:, 'is_initialized', 0)
            \ && index(get(g:, 'unwanted_startup_directories', []), getcwd()) != -1
    lcd $GARBAGEDIR
endif
let s:is_initialized = 1
