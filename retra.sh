#! /bin/sh
# @(#) retra.sh ver.1.4  2015.9.14  (c)Takeru.
#
# Usage:
#      retra.sh [-log]
#
# Description:
#      This script reduces the volume of your Mac's trash box. 
#      Removing the old files before more than half year
#      and the empty directories from your trash box.
#
#      -log    Display a log file.
#
#      Copyright (c) 2014 Takeru.
#      Released under the MIT license
#      http://opensource.org/licenses/MIT
#
#############################################################
set -o nounset                              # Treat unset variables as an error
tmpfile="/tmp/retrash"
logfile=$HOME"/log/retrash.log"
if [ $# == 0 ]; then 
if [ "`tail -1 $logfile`" == "0bytes reduced." ]; then 
	head -$((`cat $logfile | wc -l` - 2)) $logfile > $tmpfile
	mv $tmpfile $logfile
fi
echo -------------`date +%F`------------- >> $logfile
find $HOME/.Trash -mtime +182 | sed 's/^/"/;s/$/"/' | xargs ls -l | awk '{volume += $5}END{printf("%dbytes reduced.\n",volume)}' | sed ':loop
s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/
t loop' >> $logfile
tail -2 $logfile
find $HOME/.Trash -mtime +182 | tee -a $logfile | awk '{print "\047"$0"\047"}' | xargs -J % mv % /tmp/
else
if [ "$1" == "-log" ]; then 
	cat $logfile
else
	echo "Unknown parameter."
fi
fi
