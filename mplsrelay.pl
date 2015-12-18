

###########################
# main program
###########################
#
#
#  command line arguments
#    ARGV[0] = router-list-file
#
###########################

my $gotSerial = 0;
my $numArgs = $#ARGV + 1;

if ( $numArgs < 1 ) {

    print "\nUsage :  text2Excel <excel filename> <text file>.....\n";
    print "where teh textfile argument may be repeated as many times as needed\n";
    exit;

}


 $filename = $ARGV[0];

 open (SOURCE, $filename) or die ("could not open  file $filename\n");


while (<SOURCE>)
 {

if ( /^\s*(interface\s+serial.*)/i)
 {
   $gotSerial = 1;
   $intLine = $1;
 }
elsif (/^\s*interface/i)
 {
   $gotSerial = 0;
 }
elsif (/^\s*!/)
 {
   $gotSerial = 0;
 }


if (/^\s*(mpls-relay.*)/)
 {
   $mplsRelay = $1;
   if ($gotSerial)
    {
     print "$intLine\n";
     print "no mpls-relay\n";
     print "$mplsRelay relay-format frame-relay\n";
     print "\n";
    }
 }


 } # end while (<SOURCE>)
