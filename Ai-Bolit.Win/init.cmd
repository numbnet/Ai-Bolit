@echo off
REM	goto asadmin
	color 0a
	chcp 1251
TIMEOUT /T 1 /NOBREAK
goto menu

REM java -version 
REM if errorlevel 1 goto javaerror
if exist %~dp0 goto menu


:menu
echo ========================================
echo    Для самостоятельной проверки сайта
echo ----------------------------------------
echo             Ai-Bolit Menu
echo ----------------------------------------
echo 1 : Проверка в обычном режиме (start.bat)
echo 2 : Проверка в параноидальном режиме (start_paranoic.bat)
echo 3 : Проверка и Создание AI-QUARANTINE-XXXXX.zip (scan_and_quarantine.bat)
REM echo 4 : 
echo ----------------------------------------
echo x : Exit
echo i : Info
echo ========================================
set /p NUM="Choice :"
if "%NUM%"=="1" goto normal
if "%NUM%"=="2" goto paranoic
if "%NUM%"=="3" goto quarantine

if "%NUM%"=="x" goto quit
if "%NUM%"=="i" goto info


:normal
cls
REM  KOD
cmd /k ".\start_default.bat"
pause
cls
goto menu


:paranoic
cls
REM  KOD
.\start_paranoic.bat
pause
cls
goto menu


:quarantine
cls
REM  KOD
scan_and_quarantine.bat
pause
cls
goto menu

REM cmd\7za a -tzip deodex_install.zip system


:info
cls
echo ======================== INFO =======================
echo Важно! Не распаковывать данный архив в каталог с русскими буквами.
echo Например:
echo C:\Documents and Settings\Михаил\Загрузки\aibolit-for-windows\ - не будет работать
echo 
echo C:\aibolit\ai-bolit-for-windows\
echo или 
echo d:\mysites\aibolit-for-windows\ - будет работать 
echo 
echo 
echo ....
echo === Для самостоятельной проверки сайта  ===
echo 
echo 1. распакуйте архив резервной копии вашего сайта или 
echo файлы, которые вы хотите проверить, в папку site
echo ...
echo 2. запустите start.bat (проверка в обычном режиме) или 
echo start_paranoic.bat (проверка в параноидальном режиме) 
echo для того чтобы проверить сайт на вирусы и хакерские скрипты
echo ...
echo 3. по завершении проверки появится файл AI-BOLIT-REPORT.html
echo ...
echo 
echo Для проверки отчета специалистами 
echo 
echo 1. распакуйте архив резервной копии вашего сайта или файлы,
echo которые вы хотите проверить, в папку site
echo ...
echo 2. запустите scan_and_quarantine.bat 
echo ...
echo 3. по завершении проверки появится файл AI-QUARANTINE-XXXXX.zip
echo и отчет AI-BOLIT-REPORT (вместо XXXXX будут цифры)
echo 
echo 4. отправьте архив AI-QUARANTINE-XXXXX.zip по эл.почте 
echo на ai@revisium.com с темой письма "Проверить отчет". 
echo В архиве будет все необходимое, включая отчет.
echo 
echo =====================================================
pause
cls
goto menu


:quit
echo ===== END KOD ======
TIMEOUT /T 10 /NOBREAK
exit
pause>nul
exit /b

:asadmin {
	reg.exe query "HKU\S-1-5-19">nul 2>&1
	if %errorlevel% equ 1 goto UACPrompt
	color 0a
	chcp 1251
}


:UACPrompt
mshta "vbscript:CreateObject("Shell.Application").ShellExecute("%~fs0", "", "", "runas", 1) & Close()"
exit /b
cmd /K goto menu
goto menu