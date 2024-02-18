@echo off
setlocal EnableDelayedExpansion

set kamitemp="%temp%\Kami\RL"
if NOT exist "%kamitemp%" (
   mkdir %kamitemp%
)

cls
Title KamiCheat -RL
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
echo [91m NOTE: You can ask by.kami for new updates, if you want to. [0m
echo.
echo.
echo [93m Welcome, %USERNAME%. Hope you enjoy the cheat.^^^^^ [0m
echo.
echo [93m Firstly, pick the option you want to : [0m
echo.
echo [96m 1 - Download cheats [0m
echo [96m 2 - Open RL with cheats [0m
echo [96m 3 - Join KamiTool server [0m
echo [96m 4 - Add by.kami on discord [0m
echo [96m 5 - Quit [0m
echo.
echo [93m Type the number of your choice: [0m

choice /c 12345 /n /m " "
if errorlevel 5 (
    goto :Leave
) else if errorlevel 4 (
    goto :AddDiscord
) else if errorlevel 3 (
    goto :Discord
) else if errorlevel 2 (
    goto :RL
) else if errorlevel 1 (
    goto :AddDriver
)

:RL
set "DLL=%kamitemp%\KamiBot.dll"
set "injector=%kamitemp%\Xenos.exe"
set "profile=%kamitemp%\kami.xpr64"
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mStarting Rocket League with some hacks... [0m
if not exist %DLL% (
    echo [91mCan't find bot file... [0m
    echo.
    echo.
    echo [93mPress ENTER to add the driver... [0m
    pause >nul
    goto :AddDriver
)
if not exist %injector% (
    echo [91mCan't find injector... [0m
    echo.
    echo.
    echo [93mPress ENTER to add the cheat file... [0m
    pause >nul
    goto :AddDriver
)
if not exist %profile% (
    echo [91mCan't find profile... [0m
    echo.
    echo.
    echo [93mPress ENTER to add the profile... [0m
    pause >nul
    goto :AddDriver
)

timeout /nobreak /t 2 >nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mFound DLL, injector and profile... [0m
timeout /nobreak /t 2 >nul
echo.
echo [93mPick your option: [0m
echo.
echo [96m 1 - Steam [0m
echo [96m 2 - Epic Games [0m
echo.
echo [93m Type the number of your choice: [0m
choice /c 12 /n /m "  " >nul
if errorlevel 2 (
    start "" "com.epicgames.launcher://apps/9773aa1aa54f4f7b80e44bef04986cea%3A530145df28a24424923f5828cc9031a1%3ASugar?action=launch&silent=false"
    goto :launchgamepls
) else if errorlevel 1 (
    start "" "steam://rungameid/252950"
    goto :next
)
:launchgamepls
echo.
echo [91mPlease launch your game. [0m
:next
echo.
timeout /nobreak /t 10 >nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mRL Started. Please wait until you arrive in the main menu of RL and press ENTER. [0m
pause >nul
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mHere are some instructions before injecting : [0m
echo.
echo.
echo [91mLimit your FPS at 120. [0m
echo.
echo [91mDisable "Vertcial Sync". [0m
echo.
echo [91mTurn off "keyboard aerial safety". [0m
echo.
echo [91mOpt for a car equipped with the Octane hitbox. [0m
echo.
echo [96mYou can now press ENTER to inject the bot. [0m
pause >nul
start "" "%injector%" --run %profile%
echo [96mBOT started. [0m
timeout /nobreak /t 2 >nul
cls 
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [96mHere are some infos about it : [0m
echo.
echo.
echo [93mThis bot can sometimes be paused by pressing ALT+F4. [0m
echo.
echo [93mThis bot is so good in snowday. [0m
echo.
echo [93mYou can easily grind at Grand Champion 1. [0m
echo.
echo.
echo [96mYou can now press ENTER to leave KamiCheat. [0m
pause >nul
goto :Leave
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
echo [93mDisabling WindowsDefender... (you will get a popup saying that it has been deactivated.) [0m
powershell Set-MpPreference -DisableRealtimeMonitoring $true >nul
timeout /nobreak /t 2 > nul
echo [96mWindows defender successfully deactivated. [0m
timeout /nobreak /t 2 > nul
set "dllURL=https://github.com/KamiHateOmg2/RLBotFiles/raw/main/KamiBot.dll"
set "injectorURL=https://github.com/KamiHateOmg2/RLBotFiles/raw/main/Xenos.exe"
set "profileURL=https://github.com/KamiHateOmg2/RLBotFiles/raw/main/kami.xpr64"
set "dll=%kamitemp%\kamibot.dll"
set "injector=%kamitemp%\Xenos.exe"
set "profile=%kamitemp%\kami.xpr64"
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo.
echo [93mDownloading bot from [96m%dllURL%... [0m
certutil -urlcache -split -f "%dllURL%" "%DLL%" > nul
timeout /nobreak /t 2 >nul
echo [93mDownload finished. [0m
timeout /nobreak /t 1 >nul
echo.
echo [93mDownloading injector from [96m%injectorURL%... [0m
certutil -urlcache -split -f "%injectorURL%" "%injector%" > nul
timeout /nobreak /t 2 >nul
echo [93mDownload finished. [0m
timeout /nobreak /t 1 >nul
echo.
echo [93mDownloading profile from [96m%profileURL%...[0m
certutil -urlcache -split -f "%profileURL%" "%profile%" > nul
timeout /nobreak /t 2 >nul
echo [93mDownload finished.[0m
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