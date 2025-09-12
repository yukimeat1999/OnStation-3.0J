@echo off

rem /////////////////////////// OnStationSetup.bat ///////////////////////////

rem This file is the OnStation setup batch file.
rem Created by Y.Fujii of Okayama University Caving Club on January 11, 2023.
rem Copyright 2023 Y.Fujii. All rights reserved.

rem //////////////////////////////////////////////////////////////////////////


rem Make sure to run the batch file with administrator privileges
openfiles > NUL 2>&1 
if not %ERRORLEVEL% == 0 (
    echo Since it was executed with general privileges, re-execute it with administrator privileges.
    powershell start-process \"%~f0\" -Verb runas
    goto exit
)

rem Start batch file with minimized
if not "%~0"=="%~dp0.\%~nx0" (
    start /min cmd /c,"%~dp0.\%~nx0" %*
    exit
)

rem Register OCX Files
setlocal
set ONSTATION_PATH=%~dp0
regsvr32.exe "%ONSTATION_PATH%grid32.ocx" "%ONSTATION_PATH%pdate32.ocx"
rem regsvr32.exe "C:\Program Files\OnStation\grid32.ocx" "C:\Program Files\OnStation\pdate32.ocx"
endlocal

exit /b