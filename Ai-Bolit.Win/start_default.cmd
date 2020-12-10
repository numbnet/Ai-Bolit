@echo off
del AI-BOLIT-REPORT.html
copy aibolit\ai-bolit.php site\aibolit_temp.php
copy aibolit\.adirignore site\.adirignore
copy aibolit\.aignore site\.aignore
copy aibolit\.aurlignore site\.aurlignore
copy aibolit\AIBOLIT-WHITELIST.db site\AIBOLIT-WHITELIST.db

IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo "Running x64"
aibolit\php55\php.exe -d short_open_tag=on site\aibolit_temp.php --mode=1 --report=..\AI-BOLIT-REPORT.html

GOTO END

:32BIT
echo "Running x86"
aibolit\php55\php.exe -d short_open_tag=on site\aibolit_temp.php --mode=1 --report=..\AI-BOLIT-REPORT.html

GOTO END

:END

del site\AI-BOLIT-DOUBLECHECK.php
del site\aibolit_temp.php
del site\.adirignore
del site\.aignore
del site\.aurlignore
del site\AIBOLIT-WHITELIST.db

echo ---------------------------------------------------------
echo Сканирование завершено. Отчет о сканировании AI-BOLIT-REPORT.html 
pause