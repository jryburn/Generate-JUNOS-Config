# /usr/lib/perl5/5.8.0/Net;

$vpn = 1;
$n1 = '2.2.2.2';
$n2 = '6.6.6.6';
while ($vpn <= 1000) {

print "routing-instances \{\n";
print "    VSI_$vpn \{\n";
print "        instance-type vpls;\n";
print "        protocols \{\n";
print "            vpls \{\n";
print "                no-tunnel-services\; \n";
print "                vpls-id $vpn\; \n";
print "                mesh-group metro-WDC \{\n";
print "                    neighbor $n1\; \n";
print "                \}\n";
print "                mesh-group metro-NYC \{\n";
print "                    neighbor $n2\; \n";
print "                \}\n";
print "            \}\n";
print "        \}\n";
print "    \}\n";
print "\}\n";

 $vpn++;
}

