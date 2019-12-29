@echo off

PUSHD "%~dp0"
SETLOCAL enabledelayedexpansion

echo %~dp0
mklink "%USERPROFILE%\_vimrc" %~dp0.vimrc

ENDLOCAL
EXIT /B

