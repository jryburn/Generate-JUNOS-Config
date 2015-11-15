# /usr/lib/perl5/5.8.0/Net;

$num = 1;
$vlan = 2;
$sum = 2;
$host = 2;
$row = 1;

while ($vlan < 1000) {
        if ($host > 254) { $host = 2; $row ++}

print "routing-instances \{\n";
print "    VRF$num \{\n";
print "        instance-type vrf;\n";
print "        interface ge-0\/0\/3.$vlan;\n";
print "        route-distinguisher 100:$num;\n";
print "        vrf-target target:200:$num;\n";
print "        vrf-table-label;\n";
print "        protocols \{\n";
print "            bgp \{\n";
print "                group EBGP$num \{\n";
print "                    type external;\n";
print "                     peer-as $vlan; \n";
print "                     neighbor 192\.1\.$row\.$host; \n";
print "                \}\n";
print "            \}\n";
print "        \}\n";
print "    \}\n";
print "\}\n";
 
 $num++;
 $vlan++; 
 $sum++;
 $host+=4;
}

