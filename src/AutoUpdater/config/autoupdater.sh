@echo off

set APP_PATH="c:\Program Files (x86)\HelloWorld\maintenancetool.exe"
set SCRIPT_PATH=%~dp0controlscript.qs

REM アップデート確認
%APP_PATH% --checkupdates

if %errorlevel% == 0 (
echo アップデートあり
%APP_PATH% --updater --script %SCRIPT_PATH%
) else (
echo アップデートなし
)

