#! /bin/bash
#
## Usage: ./passphrase.sh [N] [WORDLIST]
##        ./passphrase.sh -h|--help
##
## Generate a passphrase, as suggested by http://xkcd.com/936/
##
##   N
##            The number of words the passphrase should consist of
##            Default: 4
##   WORDLIST
##            A text file containing words, one on each line
##            Default: /usr/share/dict/words
##
## OPTIONS
##   -h, --help
##              Print this help message
##
## EXAMPLES
##
##   $ ./passphrase.sh -h
##   ...
##   $ ./passphrase.sh
##   unscandalous syagush merest lockout
##   $ ./passphrase.sh /usr/share/hunspell/nl_BE.dic 3
##   tegengif/Ze Boevink/PN smekken 

#---------- Shell options -----------------------------------------

#---------- Variables ---------------------------------------------
num_words=0
word_list=""

#---------- Main function -----------------------------------------
main() {
  process_cli_args "${@}"
  generate_passphrase
}

#---------- Helper functions --------------------------------------

# Usage: generate_passphrase
# Generates a passphrase with ${num_words} words from ${word_list}
generate_passphrase() {
  output=""
  counter=0
  while [ "${counter}" -le "${num_words}" ]; do
    word=$(shuf -n 1 "${word_list}")
    output="${output}${word} "
    counter=$((counter + 1))
  done
  echo "${output}"
}

# Usage: process_cli_args "${@}"
#
# Iterate over command line arguments and process them
process_cli_args() {
  

  # If the number of arguments is greater than 2: print the usage
  # message and exit with an error code
  if [ ${#} -gt 2 ]; then
        echo "Er mogen maximaal 2 argumenten meegegeven worden"  >&2
        exit 1
   else
        for argument in ${@}; do
            case ${argument} in
                help | -h | --help)
                    usage
                    exit 0
                ;;
                
                -[a-zA-Z])
                    echo "this is not possible" >&2
                    exit 1
                ;;
                
                *)
                    if [ -f "${argument}" ]; then
                        word_list=${argument}
                    else
                        num_words=${argument}
                    fi
                ;;
            esac 
        done     
        
  fi

  # Loop over all arguments
  

    # Use a case statement to determine what to do
    

      # If -h or --help was given, call usage function and exit
      

      # If any other option was given, print an error message and exit
      # with status 1
      

      # In all other cases, we assume N or WORD_LIST was given
      
        # If the argument is a file, we're setting the word_list variable
        
        # If not, we assume it's a number and we set the num_words variable
        
}

# Print usage message on stdout by parsing start of script comments.
# - Search the current script for lines starting with `##`
# - Remove the comment symbols (`##` or `## `)
usage() {
    grep -E '^\s*##' "$0" | sed -E 's/^\s*## ?//'
}

# Call the main function
main "${@}"


