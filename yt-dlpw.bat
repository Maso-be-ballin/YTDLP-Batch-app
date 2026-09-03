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
:: ===== Editable Settings =====
set "width=50"
set "text=Version: %version% | Creator: %creator%"
set "cornerChar=+"
set "hChar=-"
set "vChar=|"
:: =============================

:: Build top border
set "top=%cornerChar%"
for /l %%i in (1,1,%width%) do set "top=!top!%hChar%"
set "top=!top!%cornerChar%"

:: Build bottom border
set "bottom=%cornerChar%"
for /l %%i in (1,1,%width%) do set "bottom=!bottom!%hChar%"
set "bottom=!bottom!%cornerChar%"

echo !top!

:: Calculate text length
set "len=0"
for /l %%i in (0,1,200) do (
    if "!text:~%%i,1!"=="" goto doneLen
    set /a len+=1
)
:doneLen

:: Center text
set /a left=(width - len) / 2
set /a right=width - len - left

set "line=%vChar%"
for /l %%i in (1,1,%left%) do set "line=!line! "
set "line=!line!!text!"
for /l %%i in (1,1,%right%) do set "line=!line! "
set "line=!line!%vChar%"

echo !line!
echo !bottom!

endlocal
echo.
echo [1] Download Audio
echo [2] Download Video
echo [3] Download from List
echo [4] Exit
echo.
SET /P choice="Type 1, 2, 3, or 4 then press ENTER: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto audio
if '%choice%'=='2' goto video
if '%choice%'=='3' goto list
if '%choice%'=='4' goto close 
echo Invalid choice, try again.
goto start

:audio
cls
echo audio menu
set /p "URL=VIDEO URL HERE: "
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\audio" -o "%%(title)s.%%(ext)s" -x --audio-format mp3 --audio-quality 192 --embed-thumbnail --embed-metadata --download-archive old.txt %URL%
echo.
goto close

:video
cls
echo video menu
set /p "URL=VIDEO URL HERE: "
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\video" -o "%%(title)s.%%(ext)s" -f "bestvideo[ext=mp4][vcodec*=h264]+bestaudio[ext=m4a]/best[ext=mp4]" --merge-output-format mp4 --embed-thumbnail --embed-metadata --download-archive old.txt 7%URL%
echo.
goto close

:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!
:: SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER,SPACER!

:list
cls
echo list menu
echo.
SET /P choice="Type 1, OR 2 then press ENTER: "
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto list-audio
if '%choice%'=='2' goto list-video
echo Invalid choice, try again.
goto start

:list-audio
cls
echo list-audio menu
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\audio" -o "%%(title)s.%%(ext)s" -x --audio-format mp3 --audio-quality 192 --embed-thumbnail --embed-metadata -a list.txt --download-archive old.txt
echo.
echo.
goto close

:list-video
cls
echo list-video menu
echo.
"appdata\yt-dlp-batch-v1.1.0\yt-dlp.exe" -P "downloads\video" -o "%%(title)s.%%(ext)s" -f "bestvideo[ext=mp4][vcodec*=h264]+bestaudio[ext=m4a]/best[ext=mp4]" --merge-output-format mp4 --embed-thumbnail --embed-metadata -a list.txt --download-archive old.txt
echo.
goto close


:: Close the script
:close
echo press enter to close
pause
exit

