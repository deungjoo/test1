REM adb-ip-conn-v1.bat - adb script.

@echo off

set prog_name=adb-ip-conn-v1.bat
set argc_num=0

for %%x in (%*) do (
  set /a argc_num+=1
)

echo argc_num: %argc_num%

if "%argc_num%" neq "1" (
  echo Usage: %prog_name% ^<ip-addr^>
  goto tbl_end
)

set ip_addr=%1

echo ip_addr: %ip_addr%
echo ---
timeout /t 1 > nul

adb kill-server && adb start-server
echo ---
timeout /t 1 > nul

adb connect %ip_addr%
echo ---
adb wait-for-device
timeout /t 1 > nul

adb devices
echo ---
timeout /t 1 > nul

REM adb root
REM echo ---
REM adb wait-for-device
REM timeout /t 1 > nul

:tbl_end




