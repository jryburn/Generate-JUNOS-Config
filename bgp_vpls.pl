# /usr/lib/perl5/5.8.0/Net;

$vpn = 1;
$vlan = 2;
$interface = "ge\-0\/0\/0";
$host = 2;
$lo = '2.2.2.2';
$as = '100';
while ($vlan <= 1000) {


print "interfaces \{ \n";
print "    $interface \{ \n";
print "        flexible-vlan-tagging\; \n";
print "        encapsulation flexible-ethernet-services\; \n";
print "        unit $vlan \{ \n";
print "             encapsulation vlan\-vpls\; \n";
print "             vlan\-id $vlan \n";
print "             family vpls \n";
print "        \}\n";
print "     \} \n";
print "\}\n";
print "routing-instances \{\n";
print "    VSI_$vpn \{\n";
print "        instance-type vpls;\n";
print "        interface $interface\.$vlan;\n";
print "        route-distinguisher $lo:$vpn\;\n";
print "        vrf-target target:$as:$vpn\;\n";
print "        protocols \{\n";
print "            vpls \{\n";
print "                site-range 10\; \n";
print "                no-tunnel-services\; \n";
print "                site MAR$host\_$vpn \{\n";
print "                    site-identifier $host\; \n";
print "                \}\n";
print "            \}\n";
print "        \}\n";
print "    \}\n";
print "\}\n";

 $vlan++; 
 $vpn++;
}

