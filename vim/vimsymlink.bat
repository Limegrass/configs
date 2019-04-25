IF NOT EXIST %USERPROFILE%\_vimrc ^
    ( mklink %USERPROFILE%\_vimrc     %USERPROFILE%\git\configs\vim\_vimrc )
IF NOT EXIST %USERPROFILE%\_vsvimrc ^
    ( mklink %USERPROFILE%\_vsvimrc   %USERPROFILE%\git\configs\vim\_vsvimrc)
IF NOT EXIST %USERPROFILE%\_ideavimrc ^
    ( mklink %USERPROFILE%\_ideavimrc %USERPROFILE%\git\configs\vim\_ideavimrc )

IF NOT EXIST %USERPROFILE%\.vim\ ^
( mkdir %USERPROFILE%\.vim )

mklink /D %USERPROFILE%\.vim\UltiSnips %USERPROFILE%\git\configs\vim\UltiSnips

mklink %USERPROFILE%\.vim\coc-settings.json %USERPROFILE%\git\configs\vim\coc-settings.json
mklink %USERPROFILE%\AppData\Local\nvim\coc-settings.json %USERPROFILE%\git\configs\vim\coc-settings.json
