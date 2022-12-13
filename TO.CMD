@echo off
echo Please select Data Drive.
set /p filepath="(D:,E:,...)>"
echo.
echo Please select target folder path.(New Create)
set /p TargetFilePath="(Sample:'X:\path\to')"
echo.
echo Start moveing?
set /p start="(y/N)>"
if %start% == y (Goto filecopy)
if %start% == Y (Goto filecopy)
rem if exist %filepath%\MoverData.7z (Goto exfile)
rem if not exist %filepath%\MoverData.7z if exist %filepath%\MoverData (Goto cpfile)
goto cancel

rem :cpfile
rem xcopy

:filecopy
echo Creating directory...
mkdir %TargetFilePath%
echo Copying files...
xcopy /s /e /h /i %filepath%\*.* %TargetFilePath%

:cancel
echo operation has been canceled.
goto complete

:complete
cd %MoverRoot%
pause
menu.cmd
