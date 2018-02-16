:: Archive all files in the current folder using 7z
FOR %i IN (*.*) DO 7z.exe a "%~ni.7z" "%i"
