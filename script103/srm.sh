#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

 if [ ! -d ~/.trash ]; then
      mkdir ~/.trash
      echo "Created trash folder ~/.trash"   
 fi

if [ ${#} -gt 0 ]; then

    if [ -f ${1} ]; then
    
        mv ${1} ~/.trash/${1}
        
    elif [ -d ${1} ]; then
        
        echo "else"
        for file in  ${1}; do
            mv ${1}/* ~/.trash/
        done
        
    else
        echo "${1} is not a file! Skipping..."
    fi
   

    
else
    echo "Expected at least one argument!"
    
fi