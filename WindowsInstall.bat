@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( 
    goto gotAdmin 
)
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


set HOME="%UserProfile%"
set VIMFILES="%UserProfile%\vimfiles"
set VIMRC="%UserProfile%\_vimrc"

echo Build VIM env directory...
mkdir "%VIMFILES%"

echo Build Directory for autoload...
mkdir "%VIMFILES%"\autoload"

echo Copy base init file to %VIMFILES% 
copy _vimrc %VIMFILES%
copy ctags.exe C:\
xcopy _vim\* %VIMFILES% /E /Y

echo build vimrc shortcut...
mklink "%VIMRC%" "vimfiles\_vimrc"

echo Initial base plugin...
call :InstallCurl
git clone http://github.com/gmarik/vundle.git %VIMFILES%/bundle/vundle
::vim -c InitENV
echo -------Note-------
echo Must initial last env setting at vim :InitEnv
echo -------DONE-------
pause
goto exit

:InstallCurl
    @rem Do not use "echo off" to not affect any child calls.
    @setlocal

    @rem Get the abolute path to the parent directory, which is assumed to be the
    @rem Git installation root.
    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
    @if not exist "%HOME%" @set HOME=%USERPROFILE%

    @curl.exe %*
    
:exit
