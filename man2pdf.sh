#!/bin/bash
# Bash shell script to open man pages in Preview
# so that later user can save them to PDF
# Created by Danijel J <http://www.danijelj.com>, under MIT..
# ----------------------------------------------------------------------

man -t $1 | open -f -a /Applications/Preview.app
# osascript -e 'tell "Preview" 
