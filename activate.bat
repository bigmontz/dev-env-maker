@echo off
SETLOCAL enableDelayedExpansion
SET argCount=0
FOR %%x in (%*) DO (
   SET /A argCount+=1
   SET "argVec[!argCount!]=%%~x"
)

ECHO Number of modules passed: %argCount%

FOR /L %%i in (1,1,%argCount%) DO (
    ECHO Activating module '!argVec[%%i]!'
    CALL "!argVec[%%i]!/activate.bat"
)

ENDLOCAL
ECHO DONE!