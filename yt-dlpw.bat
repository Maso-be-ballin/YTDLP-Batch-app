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
if '%choice%'=='1' goto audio
if '%choice%'=='2' goto video
if '%choice%'=='3' goto close
echo Invalid choice, try again.
goto start

:audio
cls
echo audio menu
set /p URL=VIDEO URL HERE:
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\audio" -o "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 192 --embed-thumbnail %URL%
echo.
goto close

:video
cls
echo video menu
set /p URL=VIDEO URL HERE:
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\video" -o "%(title)s.%(ext)s" -f "bv*[height<=1080][ext=mp4]+ba[ext=m4a]/b[height<=1080][ext=mp4]" --merge-output-format mp4 %URL%
echo.
goto close

:close
echo press enter to close
pause
exit

