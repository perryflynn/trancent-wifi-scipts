trancent-wifi-scipts
====================

Adds a telnet server and a http shell to the trancent wi-fi sd card to gain root access. 
Thanks to Pablo to find the exploits: http://haxit.blogspot.com.es/2013/08/hacking-transcend-wifi-sd-cards.html

* `httpshell.pl` Insert this in /www/cgi-bin/ and start it in browser. 
It provides a full root http shell for troubleshooting if the telnet daemon is broken.

* `autorun.sh` Starts the telnet server and links the http shell in webservers root. 
Place this in the root of the SD card. (Thanks for trancent for this hacker-friendly backdoor)

