@echo off

REM TULE PREIMENUJ V ŽELJENI EXCEL VIR
set source_excel_file=demo.xlsx
REM TULE PREIMENUJ V ŽELJENI EXCEL VIR

echo "KOPIRAJ in PREIMENUJ .xlsx datoteko iz .pdf"
set /p "choice=Ali naj se skripta požene v trenutnem direktoriju? (y/n): "

if "%choice%"=="n" (
    set /p "folder=Vnesi pot kjer naj se skripta požene: "
    cd "%folder%"
)

REM Najdi vse pdf file
for /R %%I in (*.pdf) do (
    set "pdf_file=%%~fI"
    set "excel_file=%%~dpnI.xlsx"

    REM Preveri če tak file ne obstaja
    if not exist "!excel_file!" (
        copy "%source_excel_file%" "!excel_file!"
    )
)

echo "Uspešno kreiranih novih datotek."