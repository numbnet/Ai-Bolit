@echo off

java -version 
if errorlevel 1 goto javaerror
if exist %~dp0 goto menu

:menu
echo ========================================
echo		     KitKat Deodexer
echo ----------------------------------------
echo                Main Menu
echo ----------------------------------------
echo 1 : Create working directory
echo 2 : Pull files from your device
echo 3 : Deodex all files
echo 4 : Add deodexed files to zip
echo ----------------------------------------
echo x : Exit
echo i : Info
echo ========================================
set /p NUM="Choice :"
if "%NUM%"=="1" goto wodir
if "%NUM%"=="2" goto pfile
if "%NUM%"=="3" goto dex
if "%NUM%"=="4" goto azip
if "%NUM%"=="x" goto quit
if "%NUM%"=="i" goto info

:wodir
cls
@echo Creating working directory and system\app system\framework system\priv-app folders...
@echo app
mkdir system
mkdir system\app
mkdir system\priv-app
mkdir system\framework
mkdir work
pause
cls
goto menu

:pfile
cls
cmd\adb wait-for-device
@echo Pulling files from your device...
cmd\adb pull /system/app system\app
cmd\adb pull /system/priv-app system\priv-app
cmd\adb pull /system/framework system\framework
pause
cls
goto menu

:dex
cls
@echo;
@echo Starting deodex...

for %%i in (system\app\*.apk) do (
if exist system\app\%%~ni.odex (
java -jar cmd\baksmali.jar -d system\framework -x system\app\%%~ni.odex -o work\%%~ni
java -jar cmd\smali.jar work\%%~ni -o classes.dex
cmd\7za a -tzip %%i classes.dex
del classes.dex
rmdir /Q /S work\%%~ni
del system\app\%%~ni.odex
)
)

for %%i in (system\priv-app\*.apk) do (
if exist system\priv-app\%%~ni.odex (
java -jar cmd\baksmali.jar -d system\framework -x system\priv-app\%%~ni.odex -o work\%%~ni
java -jar cmd\smali.jar work\%%~ni -o classes.dex
cmd\7za a -tzip %%i classes.dex
del classes.dex
rmdir /Q /S work\%%~ni
del system\priv-app\%%~ni.odex
)
)

for %%i in (system\framework\*.apk) do (
if exist system\framework\%%~ni.odex (
java -jar cmd\baksmali.jar -d system\framework -x system\framework\%%~ni.odex -o work\%%~ni
java -jar cmd\smali.jar work\%%~ni -o classes.dex
cmd\7za a -tzip %%i classes.dex
del classes.dex
rmdir /Q /S work\%%~ni
del system\framework\%%~ni.odex
)
)

for %%i in (system\framework\*.jar) do (
if exist system\framework\%%~ni.odex (
java -jar cmd\baksmali.jar -d system\framework -x system\framework\%%~ni.odex -o work\%%~ni
java -jar cmd\smali.jar work\%%~ni -o classes.dex
cmd\7za a -tzip %%i classes.dex
del classes.dex
rmdir /Q /S work\%%~ni
del system\framework\%%~ni.odex
)
)

@echo;
@echo deodexed files are stored in system\app, system\priv-app, system\framework folder.
pause
cls
goto menu

:azip
cls
@echo;
@echo Adding deodexed files to deodex_install.zip
cmd\7za a -tzip deodex_install.zip system

@echo Completed.
pause

:info
cls
echo ======================== INFO =======================
echo This is a deodexer for KitKat Roms
echo This tool is based on Kamome deodexer for Xperia 4.4
echo May work on all odexed kitkat roms
echo Always do a nandroid backup before installing
echo Do with your own risk
echo =====================================================
pause
cls
goto menu

:javaerror
cls
echo Java is not installed, please install java to deodex
echo If you dont install java, maybe some error will occur
pause
cls
goto menu

:quit