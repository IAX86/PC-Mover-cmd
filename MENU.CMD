@echo off

:select
echo Please select action.
echo ======================================
echo 1:Start Moving(From This Computer)
echo 2:Start Moving(To This Computer)
echo 3:Exit
echo ======================================
echo.
goto run

:run
set run=
set /p run=">"
if %run% == 1 (goto from)
if %run% == 2 (goto to)
if %run% == 3 (Goto quit)
if not %run% == 1 if not %run% == 2 if not %run% == 3 (
    goto run
)

:from
from.CMD
goto select

:to
to.CMD
goto select

:quit
quit.CMD