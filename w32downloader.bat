@echo off

rem Welcome
echo Windows FPGA svf Downloader! -> Based on OpenOCD!

rem Find the cfg!
set mypath=%cd%
for %%f in (*.cfg) do ( 
    set x=%%f
)
IF EXIST %mypath%\%x% (echo Found cfg file: %x%) ELSE (echo ERROR: file %x% not found! pause)


rem Copy the cfg to temp
IF EXIST "%localappdata%\Temp\"%x% (echo Copied cfg to TEMP: Success!!) ELSE (xcopy /s %mypath%\%x%  "%LocalAppData%\Temp")

rem Find the arg1 SVF file
set FILENAME=%1
IF EXIST %FILENAME% (echo Foung svf file: %FILENAME%) ELSE (echo ERROR: file %FILENAME% not found! pause)

rem Copy the SVF to temp
for /F "delims=" %%i IN ("%FILENAME%") DO (
	set filedrive=%%~di
	set filepath=%%~pi
	set filename0=%%~ni
	set fileextension=%%~xi
)
set filename_only=%filename0%%fileextension%
IF EXIST "%localappdata%\Temp\"%filename_only% (echo Success!!) ELSE (xcopy /s %FILENAME%  "%LocalAppData%\Temp")

rem Launch from temp
set COMM=-f %x% -c "svf 
set COMBINED=%COMM%%filename_only:"=% progress" -c "exit"
cd "%localappdata%\Temp\"
start openocd %COMBINED%
echo "Done, check OpenOCD window!"
cd %mypath%