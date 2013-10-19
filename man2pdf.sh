#!/bin/bash

version="2.0.1"

###############################################################################
# Load All Functions                                                          #
###############################################################################

# Check if man page installed
function manExist {
	if [ ! -f /usr/share/man/man1/man2pdf.1 ]
	then
	    sudo curl "https://raw.github.com/danijeljames/man2pdf/master/man2pdf.1" -o "/usr/share/man/man1/man2pdf.1"
		echo "Man page for man2pdf now installed!"
		showHelp
	else
		echo "Man page already installed!"
		showHelp
	fi
}


# Show script help
function showHelp {
        clear
        echo "man2pdf $version"
        echo 
        echo 'Usage: $1 [-h | manpage | -i]'
        echo 
        echo 'Option:'
        echo '   -h          This help file'
        echo '   -i          Auto-install manpage (requires sudo)'
        echo '   manpage     Name of the manpage to open in Preview'
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
        -i )					manExist
        						exit
        						;;
        * )                     manPipe
                                exit 1
esac
