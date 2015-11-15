# /usr/lib/perl5/5.8.0/Net;

$host =1;
$net = 10;
$lcc = 192;
$slot = 1;
$pic = 1;
$unit = 0;
# STARTING VLAN 
$vlan = 0;
# NUMBER OF VLANS
$numvlan = 1000;
$val = 0;
$host2 = 2; 
while ( $val < $numvlan) {
 if ( $host >254) {
   $host = 1;
   $host2 =2;
   $pic ++;
 }

print "interfaces gr-0/2/0 \{ \n";
print "    unit $vlan  \{\n";
print "        family inet \{\n";
print "            address $net\.$slot\.$pic\.$host\/32 \{\n";
print "                destination $net\.$slot\.$pic\.$host2\;\n";
print "            \}\n";
print "        \}\n";
print "        tunnel \{\n";
print "            source $lcc\.$slot\.$pic\.$host; \n";
print "            destination $lcc\.$slot\.$pic\.$host2; \n";
print "        \}\n";
print "    \}\n";
print "\}\n";

 $vlan ++;
 $host +=4;
 $host2 +=4;
 $val ++;
}

