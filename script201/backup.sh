#! /bin/bash
#
## Usage: ./backup.sh [OPTIONS] [DIR]
##
## DIR
##              The directory to back up
##              Default: the current user's home directory
##
## OPTIONS
##
##  -h, --help
##              Print this help message and exit
##
##  -d, --destination DIR
##              Set the target directory to store the backup file
##              Default:  /tmp

#---------- Shell options ------------------------------------------------------
# TODO

#---------- Variables ----------------------------------------------------------

# Time stamp for the backup file
timestamp=$(date +%Y%m%d%H%M)

# Path of the directory to back up
source=""

# Directory where to store the backup file
destination=""

#---------- Main function ------------------------------------------------------
main() {
  process_cli_args "${@}"
  
  echo "Backup from ${source} to ${destination}"

  check_source_dir
  check_destination_dir

  do_backup
}

#---------- Helper functions ---------------------------------------------------

# Usage: process_cli_args "${@}"
process_cli_args() {
  : # TODO: remove after implementing this function
  # Use a while loop to process all positional parameters
	while   [ ${#} -gt 0 ]; do
		argument=${1}
		case ${argument} in
			-h | --help)
				usage
				exit 1
				;;
				
			-d | --destination)
				shift
				destination="/temp"
				;;
				
			-[a-zA-Z])
                    echo "this is not possible" >&2
                    exit 1
                ;;
                
            *)
            	source="${argument}"
            	destination="${1}"
            	;;
         esac
		shift
		
	done

    # Put the first parameter in a variable with a more descriptive name
    

    # Use case statement to determine what to do with the currently first
    # positional parameter
    
      # If -h or --help was given, call the usage function and exit
      
      
      
      

      # If -d or --destination was given, set the variable destination to
      # the next positional parameter.
      
      
      
      

      # If any other option (starting with -) was given, print an error message
      # and exit with an error status
      
      
      
      
      

      # In all other cases, we assume the directory to back up was given.
      
      
      
      
}

# Usage: do_backup
#  Perform the actual backup
do_backup() {
  local source_dirname backup_file destination_dirname
  # Get the directory name from the source directory path name
  # e.g. /home/osboxes -> osboxes, /home/osboxes/Downloads/ -> Downloads
  # Remark that this should work whether there is a trailing `/` or not!
  #source="${source%/}"
  #source_dirname=$(basename "${source}")
  source_dirname=$(echo "${source}" | awk -F'/' '{ print $NF }')
  destination_dirname=$(echo "${destination}" | awk -F'/' '{ print $NF }')
  
  # Name of the backup file
  backup_file="${source_dirname}-${timestamp}"

  # Create the bzipped tar-archive on the specified destination
  sudo tar -cf ${destination}/${backup_file}.tar.bz2 "${source}"
  
}

# Usage: check_source_dir
#   Check if the source directory exists (and is a directory). Exit with error
#   status if not.
check_source_dir() {
  if [ ! -d ${source} ]; then
  	echo "This directory does not exist - source" >&2
  	exit 1
  fi
}

# Usage: check_destination_dir
#   Dito for the destination directory
check_destination_dir() {
  if [ ! -d ${destination} ]; then
  	echo "This directory does not exist - destination" >&2
  	exit 1
  fi
}

# Print usage message on stdout by parsing start of script comments.
# - Search the current script for lines starting with `##`
# - Remove the comment symbols (`##` or `## `)
usage() {
   grep -E '^\s*##' "$0" | sed -E 's/^\s*## ?//'
}

main "${@}"