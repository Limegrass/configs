function! Sudo(cmd)
    if has('win32')
        " TODO: Fix this for passwordless accounts
        execute '!runas /user:\%USERNAME\%@\%USERDOMAIN\% "' . a:cmd . '"'
    else
        execute '!sudo ' . a:cmd
    endif
endfunction

" Abbrev in command mode if not system cmd
function! CommandAbbreviations(abbrebiation, command)
    let l:abbrev = '''' . a:abbrebiation . ''''
    let l:command = '''' . a:command . ''''
    let l:exec = ' cnoreabbrev <expr> '.a:abbrebiation.
                \' (getcmdtype() is# '':'''.' && getcmdline() is# '.l:abbrev.')'.
                \'?('.l:command.')'.':('.l:abbrev.')'
    execute l:exec
endfunction

" Normalizes a document with both tabs and spaces
function! Retab(...) range
    if (a:0 < 2)
        execute a:firstline.','.a:lastline.' retab'
        return
    endif

    set expandtab
    let &tabstop=a:1
    let &softtabstop=a:1
    let &shiftwidth=a:1
    set noexpandtab
    if (a:firstline == a:lastline)
        retab!
    else
        execute a:firstline.','.a:lastline.' retab!'
    endif
    let &tabstop=a:2
    let &softtabstop=a:2
    let &shiftwidth=a:2
    set expandtab
    if (a:firstline == a:lastline)
        retab!
    else
        execute a:firstline.','.a:lastline.' retab'
    endif
endfunction

" Execute command while preserving cursor location
function! Preserve(command)
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! ToggleBool(setting)
    if !exists(a:setting)
        silent execute 'let '.a:setting.' = 0'
    endif
    execute 'let '.a:setting.' = !'.a:setting
    let l:reg = @b
    redir @b
    silent execute 'echo '.a:setting
    redir END
    echo a:setting.' = '.trim(@b)
    let @b = l:reg
endfunction

function! Registers()
    register
    call inputsave()
    let l:register = input('Register: ')
    call inputrestore()
    return getreg(l:register)
endfunction

function! DBProfile(profile)
      execute 'DBSetOption profile=' . a:profile
      setf sql
      DBCompleteTables
endfunction

function! StartBrowser(...)
    let l:link = ''.join(a:000)
    let l:command = '!'.GetOSProtocolHandler().' '.l:link
    silent execute l:command
endfunction

function! ClearRegisters(chars)
    let l:regs = split(a:chars, '\zs')
    for r in l:regs
        call setreg(r, [])
    endfor
endfunction

function! CopyRegisterFromInto(from, into)
    execute "call setreg('".a:into."', getreg('".a:from."'))"
endfunction

function! GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


function! RepeatForList(commandPrefix, commandSuffix, argsList)
    for l:argument in a:argsList
        execute a:commandPrefix . l:argument . a:commandSuffix
    endfor
endfunction

function! DeleteEmptyBuffers()
    let l:buffer_count = bufnr('$')
    let l:buffer_number = 1
    while l:buffer_number <= l:buffer_count
        if bufloaded(l:buffer_number)
                    \ && !len(bufname(l:buffer_number))
                    \ && !getbufvar(l:buffer_number, "&mod", 0)
            execute 'bd '.l:buffer_number
        endif
        let l:buffer_number = l:buffer_number + 1
    endwhile
endfunction

function! DeleteSavedBuffers()
    let l:buffer_count = bufnr('$')
    let l:buffer_number = 1
    while l:buffer_number <= l:buffer_count
        if bufloaded(l:buffer_number)
                    \ && !(getbufvar(l:buffer_number, '&buftype') == 'terminal')
                    \ && !getbufvar(l:buffer_number, '&mod', 0)
            execute 'bd '.l:buffer_number
        endif
        let l:buffer_number = l:buffer_number + 1
    endwhile
endfunction

function! GvimDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            if empty(&shellxquote)
                let l:shxq_sav = ''
                set shellxquote&
            endif
            let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
    endif
endfunction

" TODO: Complete these functions to generate and append to dictionary in $LOCALRC
function! GetDictionaryPath()
    let l:dictionary = ''
    redir => l:dictionary
    set dictionary?
    redir END
    let @"=substitute(l:dictionary, '  dictionary=', '', '')
endfunction

function! DBExtStripSchema()
    %s/^\(.\{-}\.\)*//g
endfunction

function! StripExtraneousWhiteSpace()
    call Preserve('%s/\s\+$//e')
    call Preserve('%s/\($\n\s*\)\+\%$//e')
    call Preserve('%s/\%^\($\n\s*\)\+//e')
endfunction

" [acceptanceRegex [, rejectionRegex]]
function! GetCharInput(...)
    let l:input = nr2char(getchar())
    let l:acceptanceRegex = get(a:, 0, '')
    let l:rejectionRegex = get(a:, 1, '')
    if l:input =~ l:rejectionRegex || l:input !~ l:acceptanceRegex
        return '\<ESC>'
    endif
    return l:input
endfunction

function! TFCheckout() abort
    if &readonly && executable('tf')
        call system('tf checkout '.expand('%'))
        edit!
    endif
endfunction

function! IsWindows()
    return has("win32") || has ("win32unix")
endfunction

function! GetOSProtocolHandler()
    if has('win32')
        return 'start'
    endif
    return 'xdg-open'
endfunction

" {app.config or web.config path} [, port [, debug_level]]
function! IISExpressRun(app_path, ...) abort
    let l:port = get(a:, '1', '8080')
    let l:debug_level = get(a:, '2', 'i') " i[nfo], w[arning], e[rror]
    execute 'vs | terminal iisexpress /path:'.a:app_path.' /port:'.l:port.' /trace:'.l:debug_level
endfunction

function! MSBuild(solution_path) abort
    let l:ms_build_path = get(g:, 'ms_build_path', 'msbuild')
    if(executable(l:ms_build_path))
        execute 'vs | terminal '.l:ms_build_path.' '.a:solution_path
    else
        echoerr 'Assign g:ms_build_path or add csc to your $PATH'
    endif
endfunction

function! GetFloatingWindowNumber()
    for l:windowNumber in range(1, winnr('$'))
        if getwinvar(l:windowNumber, 'float')
            return l:windowNumber
        endif
    endfor
    return v:null
endfunction

function! CSharpCompile(file_path, target_type)
    let l:csc_executable = get(g:, 'csc_executable_path', 'csc')
    if(executable(l:csc_executable))
        execute 'vs | terminal "'.g:csc_executable_path.'" /target:'.a:target_type.' '.a:file_path
    else
        echoerr 'Assign g:csc_file_path or add csc to your $PATH'
    endif
endfunction
