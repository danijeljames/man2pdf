#!/bin/bash

version="2.0"

###############################################################################
# Load All Functions                                                          #
###############################################################################

# Show script help
function showHelp {
        clear
        echo "man2pdf $version"
        echo 
        echo 'Usage: $1 [-h | manpage]'
        echo 
        echo 'Option:'
        echo '   -h         This help file'
        echo '   manpage    Name of the manpage to open in Preview'
        echo 
}   # end of showHelp


# Pipe manpage to Preview
function manPipe {
        man -t "${1}" | open -f -a /Applications/Preview.app
}   # end of manPipe


###############################################################################
# Standard UI                                                                 #
###############################################################################

case $1 in
        -h | --help )           showHelp
                                exit
                                ;;
        * )                     manPipe
                                exit 1
esac
