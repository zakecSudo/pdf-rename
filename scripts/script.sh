#!/bin/bash

# TULE PREIMENUJ V ŽELJENI EXCEL VIR
source_excel_file="demo.xlsx"
# TULE PREIMENUJ V ŽELJENI EXCEL VIR

echo "----------------------------------------------------------------"
echo "KOPIRAJ in PREIMENUJ $source_excel_file datoteko iz .pdf datotek"
echo "----------------------------------------------------------------"
read -p "Ali naj se skripta požene v trenutnem direktoriju? (y/n): " choice

if [ "$choice" = "n" ] || [ "$choice" = "N" ]; then
    read -p "Vnesi pot kjer naj se skripta požene: " folder
    cd "$folder"
fi

# Kopiraj demo.xlsx za vsak .pdf file
new_files=$(find . -type f -name "*.pdf" | while IFS= read -r pdf_file; do
    excel_file="$(basename "$pdf_file" .pdf).xlsx"

    # Preveri če tak file ne obstaja
    if ! [[ -f "$excel_file" ]]; then
        cp "$source_excel_file" "$excel_file"
        ((new_files=new_files+1))
    fi
    echo $new_files
done)

echo ""
echo "Uspešno kreiranih ${new_files: -1} novih datotek."