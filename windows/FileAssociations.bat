REM Creates a filetype potato (for easier registry searching)
REM and associates desired filetypes to act like a potato
REM now that's what i call maintainable!!!!!
REM assoc <extension>=<filetype> (without angle brace) to change which is which

REM Change the path to the absolute path of gvim.
ftype potato="C:\Program Files (x86)\Vim\vim81\gvim.exe" --remote-tab-silent "%%1"
assoc .=potato
REM Check the default for theses and add them as a comment before changing
REM Might be better to just do those by GUI, doesn't seem to be changing properly
REM assoc .conf=potato
REM assoc .txt=potato
REM assoc .xml=potato
