#!/bin/bash

# Controleer of een geldig argument is opgegeven
if [[ $# -eq 0 || ($# -eq 1 && $1 =~ ^[1-7]$) ]]; then
    sort_column=${1:-1}
    sort_option=""
    
    # Als sort_column 3 of 4 is, gebruik de numerieke sorteer-optie
    if [[ $sort_column -eq 3 || $sort_column -eq 4 ]]; then
        sort_option="-n"
    fi
    
    # Sorteer het passwd-bestand en gebruik column -t om het in tabelvorm weer te geven
    sort -t ":" -k${sort_column},${sort_column} ${sort_option} /etc/passwd | column -t
else
    echo "Ongeldig argument. Geef een cijfer van 1 t/m 7 op."
    exit 1
fi


