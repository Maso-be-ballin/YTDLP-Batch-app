@echo off
setlocal enabledelayedexpansion

set "configFile=config.ini"

:: Check if config.ini exists
if not exist "%configFile%" (
    echo Missing configuration file: %configFile%
    exit /b 1
)

:: Read version
for /f "tokens=1,2 delims==" %%A in ('findstr /i "^version=" "%configFile%"') do (
    set "version=%%B"
)

:: Read creator
for /f "tokens=1,2 delims==" %%A in ('findstr /i "^creator=" "%configFile%"') do (
    set "creator=%%B"
)
:start
echo Version: %version%
echo Creator: %creator%

endlocal

SET /P choice=Type 1, 2, or 3: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto '%choice%'
if '%choice%'=='2' goto '%choice%'
if '%choice%'=='3' goto '%choice%'
echo Invalid choice, try again.
goto start

:1
echo 1
goto close

:2
echo 2
goto close

:3
echo close
pause
exit

