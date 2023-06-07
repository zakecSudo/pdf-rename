#!/bin/bash

# TULE PREIMENUJ V ŽELJENI EXCEL VIR
source_excel_file = "demo.xlsx"
# TULE PREIMENUJ V ŽELJENI EXCEL VIR

echo "KOPIRAJ in PREIMENUJ .xlsx datoteko iz .pdf"
read -p "Ali naj se skripta požene v trenutnem direktoriju? (y/n): " choice

if [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
    read -p "Vnesi pot kjer naj se skripta požene: " folder
    cd "$folder"
fi

# Najdi vse pdf file
pdf_files=$(find . -type f -name "*.pdf")


# Kopiraj demo.xlsx za vsak .pdf file
new_files=0
for pdf_file in $pdf_files; do
    excel_file="$(basename "$pdf_file" .pdf).xlsx"

    # Preveri če tak file ne obstaja
    if ! [[ -f "$excel_file" ]]; then
        cp source_excel_file excel_file
        ((new_files=new_files+1))
    fi
done

echo "Uspešno kreiranih $new_files novih datotek."
