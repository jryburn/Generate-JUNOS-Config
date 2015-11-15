#!/usr/bin/perl -w


$lcc = 192;
$slot = 4;
$pic = 1;
$host = 2;
$num = 0;
$ASN = 4001;
$host2 = 1;
while ($ASN < 5001) {
       if ($host > 254) {$host = 2; $pic ++; $num = 0}

#$hexval = sprintf("%x",$host2);

print "protocols \{ \n";
print "    bgp \{ \n";
print "        group EBGP$ASN \{ \n";
print "            type external; \n";
print "            peer-as $ASN; \n";
print "            neighbor $lcc.$slot.$pic.$host; \n";
#print "            neighbor 3ffa\:$hexval\:\:2; \n";
print "        \} \n";
print "    \} \n";
print " \}\n";
 $num ++;
 $ASN ++;
 $host +=4;
 $host2 ++;

}
