#!/bin/bash
#
# Copyright (c) 2013-2014 Danijel James.
#
# You may distribute under the terms of the MIT License
#
#
# Portions of code are released under GNU Public License:
# Copyright (c) 1990, 1991, John W. Eaton.
# Copyright (c) 1994-1999, Andries E. Brouwer.
#
#
program=`basename $0`

version="3.0.0"

if [ $# = 0 ]
then
    showHelp
    exit 1
fi

manpath=`man --path | tr : '\040'

if [ "$manpath" = "" ]
then
    echo "$program: manpath is null"
    exit 1
fi

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
        echo 'Usage: $program [manpage|-h|-i]'
        echo 
        echo 'Option:'
        echo '   manpage     Name of the manpage to open in Preview'
        echo '   -i          Auto-install manpage (requires sudo)'
        echo '   -h          This help file'
        echo '   -v          Show version number'
        echo 
}   # end of showHelp

# Pipe manpage to Preview
function manPipe {
        man -t "${1}" | open -f -a /Applications/Preview.app
}   # end of manPipe


args=
for arg in $*; do
    case $arg in
        -H|-h)
		showHelp
	    exit 0
	    ;;
        -i|-I)
		manExist
	    exit 0
	    ;;
	    --version|-V|-v)
	    echo "$program $version"
	    exit 0
	    ;;
		-*)
	    echo "$program: $arg: unknown option given"
	    exit 1
	    ;;
		*)
	    args="$args $arg"
    esac
done

while [ "$1" != "" ]
do
    found=0
    for d in /var/cache/man $manpath /usr/lib
    do
        if [ -f $d/whatis ]
        man -t "${1}" | open -f -a /Applications/Preview.app
        fi
    done

    if [ $found = 0 ]
    then
        echo "$1: nothing appropriate"
    fi

exit
