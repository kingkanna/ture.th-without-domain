@echo off
TITLE TRUECorp Information Center
IF "%TRUEDOMAIN_USERNAME%" EQU "" (
    set /p USERNAME=Set Username: 
    SETX TRUEDOMAIN_USERNAME "%USERNAME%" >nul
)
IF "%TRUEDOMAIN_PASSWORD%" EQU "" (
    set /p PASSWORD=Set Password: 
    SETX TRUEDOMAIN_PASSWORD "%PASSWORD%" >nul
)
IF "%TRUEDOMAIN_PASSWORD%" EQU "" GOTO END
IF "%TRUEDOMAIN_USERNAME%" EQU "" GOTO END

set /A WHILE=0
:INFOCENTER
ECHO Authenticate \\true.th\infocenter$\T...
net use \\true.th\infocenter$\T\TestProject /user:true.th\%TRUEDOMAIN_USERNAME% %TRUEDOMAIN_PASSWORD% >nul
IF %ERRORLEVEL% EQU 0 GOTO END
ping ::1 >nul
set /A WHILE=%WHILE%+1
IF %WHILE% EQU 3 GOTO END
GOTO INFOCENTER
:RESET
ECHO Saved, Run script again.
PAUSE

:END