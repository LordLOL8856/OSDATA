@echo off
setlocal

set "OutputDir=C:\Windows\System32\config"

set "FileName=OSDATA.txt"

set "FilePath=%OutputDir%\%FileName%"

set "RandomString="
for /L %%i in (1,1,20) do (
    set /a "RandChar=!RANDOM! %% 26 + 65"
    for /f "tokens=*" %%a in ('echo %%RandChar%%') do (
        for /f "tokens=*" %%b in ('cmd /c exit %%RandChar%% ^& set /a ""') do (
            set "RandomString=!RandomString!!Char_!RandChar!"
        )
    )
)

set "RandomData=%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%"

echo %RandomData% > "%FilePath%"

echo A file named "%FileName%" with random content has been created at:
echo %FilePath%

endlocal
pause
