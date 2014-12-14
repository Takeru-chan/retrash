#! /bin/sh
# @(#) retra.sh ver.1.3  2014.12.14  (c)Takeru.
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
	cp $tmpfile $logfile
fi
echo -------------`date +%F`------------- >> $logfile
find $HOME/.Trash -mtime +182 > $tmpfile
cat $tmpfile | sed 's/^/"/;s/$/"/' | xargs ls -l | awk '{volume += $5}END{printf("%dbytes reduced.\n",volume)}' | sed ':loop
s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/
t loop' >> $logfile
cat $tmpfile | tee -a $logfile | sed 's/^/"/;s/$/"/' | xargs -J % mv % /tmp/
find $HOME/.Trash -type d -empty > $tmpfile
cat $tmpfile | tee -a $logfile | sed 's/^/"/;s/$/"/' | xargs rmdir
else
if [ "$1" == "-log" ]; then 
	cat $logfile
else
	echo "Unknown parameter."
fi
fi
