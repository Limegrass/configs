REM Place inside of the qutebrowser.exe folder before running
set "QUTEBROWSER_PATH=%~dp0qutebrowser.exe"
set "QUTEBROWSER_ICON=\"%QUTEBROWSER_PATH%\",0"
set "QUTEBROWSER_ARGS=\"%QUTEBROWSER_PATH%\" \"%%1\""

if not exist "%QUTEBROWSER_PATH%" (

	echo ERROR: "qutebrowser.exe" not found.

) else (

	reg add hklm /f>nul 2>&1

	if ERRORLEVEL 1 (

		echo ERROR: you have no privileges.

	) else (

		regedit /s "%~dp0RegistryCleaner.reg"

		reg add "HKLM\Software\Classes\qutebrowserHTML" /v "" /t REG_SZ /d "qutebrowser HTML Document" /f
		reg add "HKLM\Software\Classes\qutebrowserHTML\DefaultIcon" /v "" /t REG_SZ /d "%QUTEBROWSER_ICON%" /f
		reg add "HKLM\Software\Classes\qutebrowserHTML\shell\open\command" /v "" /t REG_SZ /d "%QUTEBROWSER_ARGS%" /f

		reg add "HKLM\Software\Classes\qutebrowserURL" /v "" /t REG_SZ /d "qutebrowser URL Protocol" /f
		reg add "HKLM\Software\Classes\qutebrowserURL" /v "EditFlags" /t REG_DWORD /d "2" /f
		reg add "HKLM\Software\Classes\qutebrowserURL" /v "FriendlyTypeName" /t REG_SZ /d "qutebrowser URL" /f
		reg add "HKLM\Software\Classes\qutebrowserURL" /v "URL Protocol" /t REG_SZ /d "" /f
		reg add "HKLM\Software\Classes\qutebrowserURL\DefaultIcon" /v "" /t REG_SZ /d "%QUTEBROWSER_ICON%" /f
		reg add "HKLM\Software\Classes\qutebrowserURL\shell\open\command" /v "" /t REG_SZ /d "%QUTEBROWSER_ARGS%" /f

		reg add "HKLM\Software\RegisteredApplications" /v "qutebrowser" /t REG_SZ /d "Software\Clients\StartMenuInternet\qutebrowser\Capabilities" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser" /v "" /t REG_SZ /d "qutebrowser" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\DefaultIcon" /v "" /t REG_SZ /d "%QUTEBROWSER_ICON%" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\shell\open\command" /v "" /t REG_SZ /d "\"%QUTEBROWSER_PATH%\"" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\InstallInfo" /v "IconsVisible" /t REG_DWORD /d "1" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities" /v "ApplicationIcon" /t REG_SZ /d "%QUTEBROWSER_ICON%" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities" /v "ApplicationName" /t REG_SZ /d "qutebrowser" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Keyboard driven web browser" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\FileAssociations" /v ".htm" /t REG_SZ /d "qutebrowserHTML" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\FileAssociations" /v ".html" /t REG_SZ /d "qutebrowserHTML" /f	
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\FileAssociations" /v ".shtml" /t REG_SZ /d "qutebrowserHTML" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\FileAssociations" /v ".xht" /t REG_SZ /d "qutebrowserHTML" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\FileAssociations" /v ".xhtml" /t REG_SZ /d "qutebrowserHTML" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\StartMenu" /v "StartMenuInternet" /t REG_SZ /d "qutebrowser" /f

		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "ftp" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "http" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "https" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "mailto" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "webcal" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "urn" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "tel" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "smsto" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "sms" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "nntp" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "news" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "mms" /t REG_SZ /d "qutebrowserURL" /f
		reg add "HKLM\Software\Clients\StartMenuInternet\qutebrowser\Capabilities\URLAssociations" /v "irc" /t REG_SZ /d "qutebrowserURL" /f

	)
)

pause
