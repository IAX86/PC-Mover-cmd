@echo off
echo Please select target drive.
set /p target="Drive(D:,E:,...)>"
echo.
echo Please select user data folder path.
set /p filepath="Path(Drive:\xxx\xxx)"
echo.
echo This file path is User Profile Path?(Y or n)
set /p Profile="(Y/n)>"
echo.
rem echo Use 7z compression?(Need long times)
rem set /p comp="(y/N)>"
rem echo.
echo Start File copy?
set /p start="(Y/n)"
rem if %start% == Y if %comp% == Y (goto comp)
rem if %start% == y if %comp% == y (goto comp)
rem if %start% == Y if %comp% == y (goto comp)
rem if %start% == y if %comp% == Y (goto comp)
if %start% == y (goto moveing1)
if %start% == Y (goto moveing1)
goto cancel

:moveing1
echo Createing directory...
mkdir %target%
echo copying Files...
xcopy /s /e /h /i %filepath%\*.* %target%\MoverData > nul 2>&1
if %Profile% == y (Goto RmProfile)
Goto moveing2

:RmProfile
echo removeing user Profile...
rd /s /q %target%\MoverData\Appdata
rd /s /q %target%\MoverData\Roaming
goto moveing2

:moveing2
echo Done!
goto moveing3

:cancel
echo operation has been cancelled.
goto moveing3

:moveing3
cd %MoverRoot%
pause
menu.cmd

rem :comp
rem cd %MoverTemp%
rem 7z a MoverData.7z %filepath% > nul 2>&1
rem move MoverData.7z %target%\MoverData.7z
rem goto moveing2
