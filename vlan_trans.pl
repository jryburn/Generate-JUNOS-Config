# /usr/lib/perl5/5.8.0/Net;

# STARTING VLANs 
$vlan_to =100;
$vlan_from = 10;
# NUMBER OF VLANS
$numvlan = 20;
$val = 0;

while ( $val < $numvlan) {

print "vlan-$vlan_to \{\n";
print "    vlan-id $vlan_to\;\n";
print "    interface \{\n";
print "        xe-0/0/0.0 \{\n";
print "            mapping \{\n";
print "                $vlan_from \{\n";
print "                    swap\;\n";
print "                \}\n";
print "            \}\n";
print "        \}\n";
print "    xe-0/0/2.0\;\n";
print "    \}\n";
print "\}\n";

 $vlan_from ++;
 $vlan_to ++;
 $val ++;
}

