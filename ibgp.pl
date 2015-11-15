#!/usr/bin/perl -w


$lcc = 2;
$slot = 2;
$pic = 1;
$num = 0;
$ASN = 1;
$host2 = 1;
while ($ASN < 1001) {
       if ($host2 > 254) {$host2 = 1; $pic ++; $num = 0}


print "protocols \{ \n";
print "    bgp \{ \n";
print "        group iBGP \{ \n";
print "            neighbor $lcc.$slot.$pic.$host2; \n";
print "        \} \n";
print "    \} \n";
print " \}\n";
 $num ++;
 $ASN ++;
 $host2 ++;

}
