# /usr/lib/perl5/5.8.0/Net;

$host =1;
$lcc = 2;
$slot = 1;
$pic = 1;
$unit = 0;
$val = 0;
$host =2;
$sub = 0;
$net = 0;


print "groups \{\n";
while ( $val < 1000 ) { 
print "static_route \{ \n";
print "    routing-options \{\n";
print "        static \{\n";
print "            route 20\.$sub\.$net\.0\/24 next-hop 10\.$slot\.$pic\.$host \n";
print "            \} \n";
print "        \}\n";
print "    \}\n";

 $val ++;
 $net++;
 $host +=4;
if ($host >254) {
 $host =2;
 $pic++;
}
if ($net >255) {
  $net =0;
 $sub ++;
}
}
print "\}\n";

