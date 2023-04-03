Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "D:\xamppbackup\autobackup_singgle_database.bat" & Chr(34), 0
Set WshShell = Nothing