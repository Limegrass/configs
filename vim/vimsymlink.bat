SET ScriptDirectory=%~dp0
IF "%VIMINIT%" == "" ^
setx VIMINIT "source %ScriptDirectory%_vimrc"

IF "%GVIMINIT%" == "" ^
setx GVIMINIT "source %ScriptDirectory%_gvimrc"

IF NOT EXIST %USERPROFILE%\_vsvimrc ^
mklink %USERPROFILE%\_vsvimrc   %ScriptDirectory%_vsvimrc

IF NOT EXIST %USERPROFILE%\_ideavimrc ^
mklink %USERPROFILE%\_ideavimrc %ScriptDirectory%_ideavimrc
