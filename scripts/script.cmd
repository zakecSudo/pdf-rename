@echo off

:: TULE PREIMENUJ V ŽELJENI EXCEL VIR
set "source_excel_file=demo.xlsx"
:: TULE PREIMENUJ V ŽELJENI EXCEL VIR

echo ----------------------------------------------------------------
echo KOPIRAJ in PREIMENUJ %source_excel_file% datoteko iz .pdf datotek
echo ----------------------------------------------------------------
set /p "choice=Ali naj se skripta pozene v trenutnem direktoriju? (y/n): "

if /i "%choice%"=="n" (
    set /p "folder=Vnesi pot kjer naj se skripta pozene: "
    echo $folder
    cd "%folder%"
    echo TEST
    echo $PWD
    echo TEST
)

:: Kopiraj demo.xlsx za vsak .pdf file
set "new_files=0"
setlocal enabledelayedexpansion

for /r %%F in (*.pdf) do (
    set "pdf_file=%%F"
    set "excel_file=!pdf_file:.pdf=.xlsx!"

    :: Preveri če tak file ne obstaja
    if not exist "!excel_file!" (
        copy "%source_excel_file%" "!excel_file!" >NUL
        set /A "new_files+=1"
    )
)

echo.
echo Uspesno kreiranih !new_files! novih datotek.
pause
