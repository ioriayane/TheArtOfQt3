@echo off

set APP_PATH="c:\Program Files (x86)\HelloWorld\maintenancetool.exe"
set SCRIPT_PATH=%~dp0controlscript.qs

REM �A�b�v�f�[�g�m�F
%APP_PATH% --checkupdates

if %errorlevel% == 0 (
echo �A�b�v�f�[�g����
%APP_PATH% --updater --script %SCRIPT_PATH%
) else (
echo �A�b�v�f�[�g�Ȃ�
)

