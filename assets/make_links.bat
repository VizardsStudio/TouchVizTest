@echo off
setlocal enabledelayedexpansion

REM Base URL for your Netlify assets
set BASEURL=https://touchviz-test.netlify.app/assets

REM Output file (will be created in the same folder)
set OUTPUT=asset_links.txt

echo Generating asset links...
del %OUTPUT% >nul 2>&1

REM Loop through all files in this folder and subfolders
for /r %%f in (*) do (
    REM Get the relative path (remove current folder prefix)
    set filepath=%%f
    set relpath=!filepath:%cd%\=!
    
    REM Replace backslashes with forward slashes for URLs
    set relpath=!relpath:\=/!
    
    REM Write full URL to output file (add slash)
    echo %BASEURL%/!relpath!>> %OUTPUT%
)

echo Done! Links saved to %OUTPUT%
pause
