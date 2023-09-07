#!/bin/bash
if [ ${#} == 0 ]; then
    echo "Geen arugmenten opgegeven!"
else
    for param in "${@}"; do
        echo "${param}"
    done
fi
    
    
        