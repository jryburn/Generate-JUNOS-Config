# /usr/lib/perl5/5.8.0/Net;

$host =1;
$lcc = 192;
$slot = 1;
$pic = 1;
$unit = 0;
# STARTING VLAN 
$vlan = 512;
# NUMBER OF VLANS
$numvlan = 3500;
$val = 0;
$host2 = 1;
while ( $val < $numvlan) {
 if ( $host >254) {
   $host = 1;
   $pic ++;
 }

$hexval = sprintf("%x",$host2);
print "ge-0/0/1 \{ \n";
print "    unit $vlan  \{\n";
print "        encapsulation vlan-ccc\;\n";
print "        vlan-id $vlan\;\n";
print "        family ccc\;\n";
print "    \}\n";
print "\}\n";

 $vlan ++;
 $host +=4;
 $host2 ++;
 $val ++;
}

