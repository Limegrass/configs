IF NOT EXIST %USERPROFILE%\_vimrc ^
echo source %~dp0_vimrc > %USERPROFILE%\_vimrc

IF NOT EXIST %USERPROFILE%\_vsvimrc ^
mklink %USERPROFILE%\_vsvimrc   %USERPROFILE%\git\configs\vim\_vsvimrc

IF NOT EXIST %USERPROFILE%\_ideavimrc ^
mklink %USERPROFILE%\_ideavimrc %USERPROFILE%\git\configs\vim\_ideavimrc

IF NOT EXIST %USERPROFILE%\.vim\ ^
mkdir  %USERPROFILE%\.vim

IF NOT EXIST %USERPROFILE%\.vim\coc-settings.json ^
mklink %USERPROFILE%\.vim\coc-settings.json %USERPROFILE%\git\configs\vim\coc-settings.json

IF NOT EXIST %USERPROFILE%\AppData\Local\nvim\ ^
mkdir %USERPROFILE%\AppData\Local\nvim

IF NOT EXIST %USERPROFILE%\AppData\Local\nvim\coc-settings.json ^
mklink %USERPROFILE%\AppData\Local\nvim\coc-settings.json %USERPROFILE%\git\configs\vim\coc-settings.json

IF NOT EXIST %USERPROFILE\AppData\Local\nvim\init.vim ^
echo source $HOME/_vimrc > %USERPROFILE%\AppData\Local\nvim\init.vim

IF NOT EXIST %USERPROFILE%\_gvimrc ^
mklink %USERPROFILE%\_gvimrc ^
%USERPROFILE%\git\configs\vim\_gvimrc
