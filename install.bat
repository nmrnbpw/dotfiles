@echo off

PUSHD "%~dp0"
SETLOCAL enabledelayedexpansion

echo %~dp0
mklink "%USERPROFILE%\_vimrc" %~dp0.vimrc
mklink "%USERPROFILE%\_gvimrc" %~dp0.gvimrc
mklink /D /J "%USERPROFILE%\vimfiles" %~dp0\vimfiles
mklink /D /J "%APPDATA%\efm-langserver" %~dp0\efm-langserver

ENDLOCAL
EXIT /B

