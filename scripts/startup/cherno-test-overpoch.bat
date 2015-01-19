@echo off

REM ENVIRONMENT VARIABLES
set cherno_bec_path="D:\dayz\instances\Chernarus.2_Overpoch\BattlEye\bec"
set bec_bin="D:\dayz\scripts\Bec\Bec.exe"

REM ####
REM ## This is not used because we are using #shutdown command in Bec
REM ####
REM Lets make sure the server isn't running first
REM the below command will get you the correct windowtitle to kill
REM tasklist /v /fi "WINDOWTITLE eq ArmA*"

REM This is here cause its being called in BEC before the shutdown
timeout 11
REM This is to make sure it died, if not we are going to kill it
echo Killing any old Arma OA 2 that are still up
taskkill /fi "WINDOWTITLE eq ArmA 2 OA Console version 1.63 : port 2302"

REM Running any maintenance that should happen
echo Running maintenance stuff
start /wait cmd /c D:\dayz\scripts\maintenance\dbfunctions.bat

REM Now lets start the server
echo Starting Dayz Overpoch Chernarus Server
:: start the server..
start "cherno" /min "D:\dayz\a2oa\arma2oaserver.exe" -port=2302 "-config=D:\dayz\instances\Chernarus.2_Overpoch\config.cfg" "-cfg=D:\dayz\instances\Chernarus.2_Overpoch\basic.cfg" "-profiles=D:\dayz\instances\Chernarus.2_Overpoch" "-name=D:\dayz\instances\Chernarus.2_Overpoch" "-mod=@DayZOverwatch;@DayZ_Epoch;@DayZ_Epoch_Server.b2" -noPause -noSound -cpuCount=2 -maxMem=2047 -bandwidthAlg=2 -exThreads=2

REM waitting for Arma OA 2 to startup, this timeout will be diff per server
timeout 20
echo 

echo Starting BEC Service
:: start bec..
cd %cherno_bec_path%
%bec_bin% -f bec-config.cfg

REM Create links
REM mklink /d d:\dayz\a2oa\@DayZ_Epoch_Server.b1\addons d:\dayz\dayz_epoch_server\b1\