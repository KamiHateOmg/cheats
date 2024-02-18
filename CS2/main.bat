@echo off
setlocal EnableDelayedExpansion

set kamitemp="%temp%\Kami\CS2"
if NOT exist "%kamitemp%" (
   mkdir %kamitemp%
)

cls
Title KamiCheat -CS2
mode con: cols=128 lines=30
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo.
    echo Requesting administrative privileges for %USERNAME%
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 

::: [91m  __  __     ______     __    __     __     [91m
::: [91m /\ \/ /    /\  __ \   /\ "-./  \   /\ \    [91m
::: [91m \ \  _"-.  \ \  __ \  \ \ \-./\ \  \ \ \   [91m
::: [91m  \ \_\ \_\  \ \_\ \_\  \ \_\ \ \_\  \ \_\  [91m
::: [91m   \/_/\/_/   \/_/\/_/   \/_/  \/_/   \/_/  [91m
::: [91m                                            [91m

                                                                                    


:select0
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo [91m NOTE: You can ask by.kami for new updates, if you want to.[0m
echo.
echo.
echo [93m Welcome, %USERNAME%. Hope you enjoy the cheat.^^^^^[0m
echo.
echo [93m Firstly, pick the option you want to : [0m
echo.
echo [96m 1 - Activate TestSigning[0m
echo [96m 2 - Add Driver[0m
echo [96m 3 - Deactivate TestSigning[0m
echo [96m 4 - Open CS2 with cheats[0m
echo [96m 5 - Join KamiTool server[0m
echo [96m 6 - Add by.kami on discord[0m
echo [96m 7 - Quit[0m
echo.
echo [93m Type the number of your choice then press ENTER: [0m

choice /c 1234567 /n /m " "
if errorlevel 7 (
    goto :Leave
) else if errorlevel 6 (
    goto :AddDiscord
) else if errorlevel 5 (
    goto :Discord
) else if errorlevel 4 (
    goto :CS2
) else if errorlevel 3 (
    goto :TestSigningOff
) else if errorlevel 2 (
    goto :AddDriver

) else if errorlevel 1 (
    goto :TestSigningOn
)
:CS2
set "driver=%kamitemp%\valthrun-driver.sys"
set "controller=%kamitemp%\controller.exe"
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mStarting CS2 with some hacks... [0m
if not exist %driver% (
    echo [91mCan't find driver... [0m
    echo.
    echo.
    echo [93mPress ENTER to add the driver... [0m
    pause >nul
    goto :AddDriver
)
if not exist %controller% (
    echo [91mCan't find cheat file... [0m
    echo.
    echo.
    echo [93mPress ENTER to add the cheat file... [0m
    pause >nul
    goto :AddDriver
)

timeout /nobreak /t 2 >nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mFound driver and cheat file... [0m
timeout /nobreak /t 2 >nul
echo [93mStarting CS2... [0m
sc start valthrun >nul
start "" "steam://rungameid/730"
echo. 
echo [93mPlease wait a bit and don't close this page... [0m
timeout /nobreak /t 10 >nul
echo [96mCS2 Started. Please wait until you arrive in the main menu of CS2 and press ENTER. [0m
pause >nul
echo [93mStarting cheats... [0m
start "" "%controller%"
timeout /nobreak /t 1 >nul
echo [96mCheat started. [0m
timeout /nobreak /t 2 >nul
cls 
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mHere are some infos about it : [0m
echo.
echo.
echo [91mTo open the cheat menu, you can either click the "pause" button on your keyboard. [0m
echo.
echo [96mOR [0m
echo.
echo [91mYou can also type win + r and type "osk", you will be able to click the "pause" if you don't have it. [0m
echo.
echo.
echo.
echo [96mYou can now press ENTER to leave KamiCheat. [0m
pause >nul
goto :Leave
exit

:TestSigningOn
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mAdding TestSigning mode... [0m
bcdedit /set testsigning on >nul
timeout /nobreak /t 3 > nul
echo [96mTest mode enabled. [0m
timeout /nobreak /t 2 > nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [91mPlease restart your computer by pressing ENTER. [93m(Please restart the script after you restarted your machine.) [0m
pause >nul
shutdown /r /t 0
exit

:TestSigningOff
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mDisabling TestSigning mode... [0m
bcdedit /set testsigning off >nul
timeout /nobreak /t 3  > nul
echo [96mTest mode disabled. [0m
timeout /nobreak /t  2 > nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [91mPlease restart your computer by pressing ENTER. [93m(Please restart the script after you restarted your machine.) [0m
pause >nul
shutdown /r /t 0
exit

:AddDriver
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mAdding KamiTemp folder to Windows Defender exclusions... [0m
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference ExclusionPath "%kamitemp%"
timeout /nobreak /t 2 > nul
echo [96mFolder successfully added to exclusion. [0m
timeout /nobreak /t 2 > nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mDisabling WindowsDefender... (you will get a popup saying that it has been deactivated.)[0m
powershell Set-MpPreference -DisableRealtimeMonitoring $true >nul
timeout /nobreak /t 2 > nul
echo [96mWindows defender successfully deactivated. [0m
timeout /nobreak /t 2 > nul
set "fileURL=https://github.com/Valthrun/Valthrun/releases/download/v0.4.1/valthrun-driver.sys"
set "fileURL2=https://github.com/Valthrun/Valthrun/releases/download/v0.4.1/controller.exe"
set "driver=%kamitemp%\valthrun-driver.sys"
set "controller=%kamitemp%\controller.exe"
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mDownloading driver from [96m%fileURL%...[0m
certutil -urlcache -split -f "%fileURL%" "%driver%" > nul
certutil -urlcache -split -f "%fileURL2%" "%controller%" > nul
timeout /nobreak /t 2 >nul
echo [93mDownload finished.[0m
timeout /nobreak /t 2  >nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mAdding driver...[0m
sc create valthrun type= kernel binpath="%driver%" >nul
timeout /nobreak /t 2 >nul
echo [96mDriver added successfully. [0m
timeout /nobreak /t 2 >nul
goto :select0

:Discord
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93m Joining discord server...[0m
powershell "[console]::beep(100,500)" && powershell "[console]::beep(150,500)" && powershell "[console]::beep(175,500)" && powershell "[console]::beep(200,500)"
echo.
echo.
start "" "https://discord.gg/zAs8bkKdVw"
echo.
echo [96m 1 - Go to KamiCheat [0m
echo [96m 2 - Exit KamiCheat [0m
echo.
echo.
set /p close=[93m Type 1 or 2 then press ENTER: [0m
IF %close%==2 goto Leave
IF %close%==1 goto select0
exit

:AddDiscord
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93m Adding by.kami on discord...[0m
powershell "[console]::beep(100,500)" && powershell "[console]::beep(150,500)" && powershell "[console]::beep(175,500)" && powershell "[console]::beep(200,500)"
echo.
echo.
start "" "https://discord.com/users/1195405120398180494"
echo.
echo [96m 1 - Go to KamiCheat [0m
echo [96m 2 - Exit KamiCheat [0m
echo.
echo.
set /p close=[93m Type 1 or 2 then press ENTER: [0m
IF %close%==2 goto Leave
IF %close%==1 goto select0
exit

:Leave
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93m Exiting KamiCheat...[0m
powershell "[console]::beep(200,500)" && powershell "[console]::beep(175,500)" && powershell "[console]::beep(150,500)" && powershell "[console]::beep(100,500)"
exit