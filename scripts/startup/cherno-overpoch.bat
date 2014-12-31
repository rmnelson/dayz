@echo off

REM ENVIRONMENT VARIABLES
set cherno_bec_path="C:\dayz\instances\Chernarus_Overpoch\BattlEye\bec"
set bec_bin="C:\dayz\scripts\Bec\Bec.exe"

REM ####
REM ## This is not used because we are using #shutdown command in Bec
REM ####
REM Lets make sure the server isn't running first
REM the below command will get you the correct windowtitle to kill
REM tasklist /v /fi "WINDOWTITLE eq ArmA*"

REM This is here cause its being called in BEC before the shutdown
timeout 11
REM This is to make sure it died, if not we are going to kill it
taskkill /fi "WINDOWTITLE eq ArmA 2 OA Console version 1.63 : port 2302"

REM Running any maintenance that should happen
C:\dayz\scripts\maintenance\dbfunctions.bat > NUL 2>1&

REM Now lets start the server
echo Starting Dayz Overpoch Chernarus Server
:: start the server..
start "cherno" /min "C:\dayz\a2oa\arma2oaserver.exe" -port=2302 "-config=c:\dayz\instances\Chernarus_Overpoch\config.cfg" "-cfg=c:\dayz\instances\Chernarus_Overpoch\basic.cfg" "-profiles=c:\dayz\instances\Chernarus_Overpoch" "-name=c:\dayz\instances\Chernarus_Overpoch" "-mod=@DayZOverwatch;@DayZ_Epoch;@DayZ_Epoch_Server" -noPause -noSound -cpuCount=4 -maxMem=2047 -bandwidthAlg=2 -exThreads=7

REM waitting for Arma OA 2 to startup, this timeout will be diff per server
timeout 20
echo 

echo Starting BEC Service
:: start bec..
cd %cherno_bec_path%
%bec_bin% -f bec-config.cfg