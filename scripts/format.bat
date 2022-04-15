@echo off

GOTO :HANDLE_ARGS


:run_black
call black %1 pex scripts tests 2>&1 | ^
findstr /V "DEPRECATION: Python 2 support will be removed in the first stable release" || true
exit /b 0

:run_isort
isort %1 pex scripts tests
exit /b 0

:HANDLE_ARGS
if /I "%1" EQU "--help" (
	CALL USAGE
    exit /b 0
)
if /I "%1" EQU "--check" (
	call run_black --check || exit /b %ERRORLEVEL%
    call run_isort --check-only || exit /b %ERRORLEVEL%
)
if /I "%1" EQU "" (
	call run_black || exit /b %ERRORLEVEL%
    call run_isort || exit /b %ERRORLEVEL%
)

:USAGE

echo USAGE: %~p0 [--check]
exit /b -1
