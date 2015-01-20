@echo off

REM check if first server is running
REM tasklist /FI "WINDOWTITLE eq ArmA 2 OA Console version 1.63 : port 2302" 2>NUL | find /I /N "arma2oaserver.exe" >NUL
tasklist /FI "IMAGENAME eq arma2oaserver-b2.exe" 2>NUL | find /I /N "arma2oaserver-b2.exe" >NUL
if "%ERRORLEVEL%"=="1" D:\dayz\scripts\startup\cherno-overpoch.bat