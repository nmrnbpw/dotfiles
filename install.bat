@echo off

PUSHD "%~dp0"
SETLOCAL enabledelayedexpansion

echo %~dp0
mklink "%USERPROFILE%\_vimrc" %~dp0.vimrc
mklink "%USERPROFILE%\_gvimrc" %~dp0.gvimrc

ENDLOCAL
EXIT /B

