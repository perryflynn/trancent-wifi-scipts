#!/usr/bin/perl
use URI::Escape;
use File::Find;   
use File::Basename;
use CGI; 

print "Content-type: text/html\n\n";
print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n";
print "<html xmlns=\"http://www.w3.org/1999/xhtml\">\n";
print "<head>\n";
print "<title>wifisd hax0r shell</title>\n";

print <<HEAD;
<style type="text/css">
   body { font-size:12px; font-family:Arial; }
   span.currcmd { background-color:#e0e0e0; border:1px solid black; border-radius:6px; padding:1px 5px 1px 5px; }
   input { width:80%; font-family:Monospace; }
   fieldset { margin-top:20px; }
</style>
<script type="text/javascript">
   function siteload() {
      document.getElementById("cmd").focus();
   }
   function set(value) {
      document.getElementById("cmd").value=value;
      document.getElementById("cmd").focus();
   }
</script>
HEAD

print "</head>";
print "<body onload='siteload()'>";

print "<h1>wifisd hax0r shell</h1>";
print "<a href=\"javascript:void(0);\" onclick=\"set('telnetd -l /bin/bash &')\">Start Telnet</a> | ";
print "<a href=\"javascript:void(0);\" onclick=\"set('uname -a; echo; cat /proc/meminfo | /mnt/sd/busybox-armv5l head -n 2; echo; cat /proc/cpuinfo')\">SysInfo</a>";

print "<form action=\"\" method=\"POST\">";
print "   /mnt/sd/busybox-armv5l&nbsp;&nbsp;<input type=\"text\" name=\"cmd\" class=\"cmd\" id=\"cmd\">";
print "</form>";

my $p = CGI->new;
my $c = $p->param("cmd");

if($c eq "") {
   $c = "No command given"
}

print "<fieldset><legend>Output of &nbsp; <span class=\"currcmd\">".$c."</span></legend>";
print "<pre>";

$out = `/mnt/sd/busybox-armv5l $c`;
print $out;

print "</pre>";
print "</fieldset>";

print "</body>\n";
print "</html>";
