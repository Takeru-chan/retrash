#! /bin/sh
# @(#) retra.sh ver.1.0  2014.12.1  (c)Takeru.
#
# Usage:
#      retra.sh
#
# Description:
#      This script reduces the volume of your Mac's trash box. 
#      Removing the old files before more than half year
#      and the empty directories from your trash box.
#
#      Copyright (c) 2014 Takeru.
#      Released under the MIT license
#      http://opensource.org/licenses/MIT
#
#############################################################
set -o nounset                              # Treat unset variables as an error
tmpfile="/tmp/retrash"
logfile=$HOME"/log/retrash.log"
echo -------------`date +%F`------------- >> $logfile
find $HOME/.Trash -mtime +182 > $tmpfile
cat $tmpfile | xargs ls -l | awk '{volume += $5}END{print(volume,"bytes reduced.")}' >> $logfile
cat $tmpfile | tee -a $logfile | xargs rm
find $HOME/.Trash -type d -empty > $tmpfile
cat $tmpfile | tee -a $logfile | xargs rmdir
