@echo off
:: CONFIG STARTS
SET WEB_PORT=2250
SET WEB_HOST=127.0.0.1
SET WEB_LAUNCH_DELAY=30
SET RESTART_DELAY=10
:: CONFIG ENDS

:: AMD SPECIFIC SETTINGS (DO NOT MODIFY!)
SET GPU_FORCE_64BIT_PTR=1
SET GPU_MAX_HEAP_SIZE=100
SET GPU_USE_SYNC_OBJECTS=1
SET GPU_MAX_ALLOC_PERCENT=100
SET GPU_SINGLE_ALLOC_PERCENT=100

echo Welcome to Zcrypt.live
echo Opening website
start cmd /c "@echo off & echo Please, wait %WEB_LAUNCH_DELAY% seconds for Zcrypt Miner status page to open... & ping 127.0.0.1 -n %WEB_LAUNCH_DELAY% > nul & if "%WEB_HOST%"=="0.0.0.0" (explorer http://127.0.0.1:%WEB_PORT%) else (explorer http://%WEB_HOST%:%WEB_PORT%) & exit"


:start
@setlocal enableextensions
@cd /d "%~dp0"
echo Starting Miner...
REM ***************************************************************************************
REM ************************************************** Change Port and Wallet Address Below

ZecMiner64.exe -zpool stratum+tls://zcrypt.live:3132 -zwal znY5pFudt6X3sHKUZ2BKBEZYCdBDAkm9Dp6.Claymore -zpsw x -mport 2250

REM ************************************************** Change Port and Wallet Address Above
REM **************************************************************************************** 
echo Miner has crashed... restarting in %RESTART_DELAY% seconds...
ping 127.0.0.1 -n %RESTART_DELAY% > nul
goto start
