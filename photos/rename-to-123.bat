@echo off
setlocal EnableExtensions EnableDelayedExpansion

pushd "%~dp0"

set "n=1"
for /f "delims=" %%F in ('dir /b /a-d') do (
  if /i not "%%~nxF"=="%~nx0" (
    ren "%%F" "__tmp__!n!%%~xF"
    set /a n+=1
  )
)

set "n=1"
for /f "delims=" %%F in ('dir /b /a-d "__tmp__*"') do (
  set "num=0!n!"
  set "num=!num:~-2!"
  ren "%%F" "!num!%%~xF"
  set /a n+=1
)

popd
echo Done.
pause
