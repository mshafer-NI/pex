@ECHO off
SET SCRIPT_DIR=%~dp0

tox -e vendor -- --no-update || GOTO :ERROR
cmd %SCRIPT_DIR%\embed_virtual_env.bat || GOTO :ERROR
git diff --exit-code || GOTO :ERROR

REM success, skip error handler
GOTO :EOF

:ERROR
exit /B -1