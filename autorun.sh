#!/bin/sh

# Place the busybox binary and this script in the root of the sd card
# http://busybox.net/downloads/binaries/latest/busybox-armv5l

# Symlink the http root shell in the webserver
# URL: http://sdcardsip/cgi-bin/httpshell.pl
ln -s /mnt/sd/httpshell.pl  /www/cgi-bin/httpshell.pl

# Start the telnet server
chmod a+x /mnt/sd/busybox-armv5l
/mnt/sd/busybox-armv5l telnetd -l /bin/bash &

