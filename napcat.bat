@echo off
setlocal enabledelayedexpansion
chcp 65001
:loop_read
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\QQ" /v "UninstallString"') do (
    set "RetString=%%b"
    goto :napcat_boot
)

:napcat_boot
for %%a in ("!RetString!") do (
    set "pathWithoutUninstall=%%~dpa"
)

set "QQPath=!pathWithoutUninstall!QQ.exe"
set ELECTRON_RUN_AS_NODE=1
echo !QQPath!

start /b node .\TQBot\TQBot 
"!QQPath!" ./napcat.mjs -q 2733208575%*

