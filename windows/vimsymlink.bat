REM Outdated with the move to a dedicatred dotfiles repo. ScriptDirectory needs to be changed before running.
SET ScriptDirectory=%~dp0
IF "%VIMINIT%" == "" ^
setx VIMINIT "source %ScriptDirectory%_vimrc"

IF "%GVIMINIT%" == "" ^
setx GVIMINIT "source %ScriptDirectory%_gvimrc"

IF NOT EXIST %USERPROFILE%\_vsvimrc ^
mklink %USERPROFILE%\_vsvimrc   %ScriptDirectory%_vsvimrc

IF NOT EXIST %USERPROFILE%\_ideavimrc ^
mklink %USERPROFILE%\_ideavimrc %ScriptDirectory%_ideavimrc
