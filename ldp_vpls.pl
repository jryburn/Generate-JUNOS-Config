# /usr/lib/perl5/5.8.0/Net;

$vpn = 1;
$vlan = 2;
$interface = "ge\-0\/0\/0";
$n1 = '2.2.2.2';
$n2 = '5.5.5.5';
while ($vpn <= 1000) {


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
print "        protocols \{\n";
print "            vpls \{\n";
print "                no-tunnel-services\; \n";
print "                    vpls-id $vpn\; \n";
print "                    neighbor $n1\; \n";
print "                    neighbor $n2\; \n";
print "            \}\n";
print "        \}\n";
print "    \}\n";
print "\}\n";

 $vlan++; 
 $vpn++;
}

