@echo off

:: TULE PREIMENUJ V ŽELJENI EXCEL VIR
set "source_excel_file=demo.xlsx"
:: TULE PREIMENUJ V ŽELJENI EXCEL VIR

echo ----------------------------------------------------------------
echo KOPIRAJ in PREIMENUJ %source_excel_file% datoteko iz .pdf datotek
echo ----------------------------------------------------------------
set /p "choice=Ali naj se skripta požene v trenutnem direktoriju? (y/n): "

if /i "%choice%"=="n" (
    set /p "folder=Vnesi pot kjer naj se skripta požene: "
    cd "%folder%"
)

:: Kopiraj demo.xlsx za vsak .pdf file
set "new_files=0"
for /r %%F in (*.pdf) do (
    set "pdf_file=%%F"
    setlocal enabledelayedexpansion
    set "excel_file=!pdf_file:.pdf=.xlsx!"

    :: Preveri če tak file ne obstaja
    if not exist "!excel_file!" (
        copy "%source_excel_file%" "!excel_file!"
        set /a "new_files+=1"
    )
    echo !new_files!
    endlocal
)

echo.
echo Uspešno kreiranih %new_files:~-1% novih datotek.
