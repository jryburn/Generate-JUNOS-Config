#!/usr/bin/perl -w


$lcc = 192;
$slot = 4;
$pic = 1;
$host = 2;
$num = 0;
$vlan = 512;
$host2 = 1;
while ($vlan < 4012) {
       if ($host > 254) {$host = 2; $pic ++; $num = 0}

#$hexval = sprintf("%x",$host2);

print "protocols \{ \n";
print "   l2circuit \{ \n";
print "            neighbor 2.2.2.2 \{\n";
print "                     interface ge\-0\/0\/1\.$vlan \{\n";
print "                         virtual-circuit-id $vlan\;\n";
print "                     \}\n";
print "        \} \n";
print "    \} \n";
print " \}\n";
 $num ++;
 $vlan ++;
 $host +=4;
 $host2 ++;

}
