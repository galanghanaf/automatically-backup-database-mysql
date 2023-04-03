@echo off

REM Setup Database Backup
SET mysql_username=root
SET mysql_password=root
SET database=dbesman
SET mysql_xampp=D:\xampp\mysql\bin\mysqldump.exe
SET backup_path=D:\xamppbackup


REM Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error

REM Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done

REM Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%

REM create file name by date & time
Set filename=Jam_%_hour%_%_minute%_%_second%_Tanggal_%_dd%_%_mm%_%_yyyy%

REM create log folder
SET myLOG=%backup_path%\log
if not EXIST %myLOG% (MKDIR %myLOG%)

REM create database folder
SET myDIR=%backup_path%\singgle_database\%database%
if not EXIST %myDIR% (MKDIR %myDIR%)

REM execute
%mysql_xampp% -u%mysql_username% -p%mysql_password% --routines --events %database% > %myDIR%\%database%_%filename%.sql

REM log information
if %ERRORLEVEL% neq 0 (
    (echo JAM=%TIME% # TANGGAL=%DATE% # Backup %database% Gagal) >> "%myLOG%\mysql_backup_log.txt"
) else (echo JAM=%TIME% # TANGGAL=%DATE% # Backup %database% Sukses) >> "%myLOG%\mysql_backup_log.txt"