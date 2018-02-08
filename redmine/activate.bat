@echo off

IF EXIST %~dp0 SETX /M PATH "%~dp0;%PATH%"

ECHO %REDMINE_URL%
ECHO %REDMINE_APIKEY%

GOTO FIM

IF "%REDMINE_URL%"=="" (
    SET /p redmine_url="Set your redmine url with procotol (Example: http://redmine.com):"
    SETX REDMINE_URL %redmine_url%
)

IF "%REDMINE_APIKEY%"=="" (
    SET /p redmine_apikey="Set your redmine url api key:"
    SETX REDMINE_APIKEY %redmine_apikey%
)


