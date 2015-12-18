#!/usr/bin/perl

use Net::Netmask;
use Getopt::Long;

my $limit = 10;
my $aspaths = 10;
my $maxlength = 32;
my $minlength = 4;
my $ipmask = 4;


GetOptions ("r|routes=s" => \$limit,
	    "a|aspath=s" => \$aspath,
	    "e|saspath=s" => \$aspathSpec,
	    "p|paths=s" => \$aspaths,
	    "l|long=s" => \$maxlength,
	    "s|short=s" => \$minlength,
	    "c|count" => \$count,
	    "i|instance=s" => \$instance,
	    "f|file=s" => \$filename,
	    "n|noas" => \$noaspath,
	    "o|policy" => \$doPolicy,
	    "h|help" => \$doHelp,
	    "b|block=s" => \$block
);

& help () if ($doHelp);

if ($instance) {
	$instanceLine = "routing-instances $instance ";
}

if ($filename) {
	open (FILE, ">$filename") || die "Cannot open \"$filename\" for writing.\n";
}

if ($maxlength < $minlength) {
	print "ERROR: Maximum length ($maxlength) cannot be shorter than miminum length ($minlength)\n";
	exit 0;
}

if ($block) {

	$block1 = new Net::Netmask ($block);
        $blockBC = $block1->broadcast();
        $blockBase = $block1->base();

	($ipnetwork,$ipmask) = split (/\//, $block);
	($blockStartA, $blockStartB, $blockStartC, $blockStartD) = split (/\./, $ipnetwork);
	($blockEndA, $blockEndB, $blockEndC, $blockEndD) = split (/\./, $blockBC);

	unless ($ipnetwork eq $blockBase) {
		print "ERROR: Network ($ipnetwork) does not fall on the specified bit boundary (/$ipmask)\n";
		exit 0;
	}
	
	if ($maxlength) {
		$maxLengthString = "1"x$maxlength;
		$dec = & bin2dec ($maxLengthString);
		$dec++;

		$maxLengthString2 = "1"x$ipmask;
		$dec2 = & bin2dec ($maxLengthString2);
		$dec2++;

		$possibleNets = $dec/$dec2;

		if ($possibleNets < 1) {
			print "ERROR: Cannot fit any /$maxlength networks into a /$ipmask\n";
			exit 0;
		}

		if ($possibleNets < $limit) {
			print "WARNING: $limit route(s) requested but only $possibleNets route(s) are possible, reducing limit to $possibleNets\n";
			$limit = $possibleNets;
		}
	}

	if ($blockStartA eq $blockEndA) {
	}

	if ($blockStartA eq $blockEndA) {
		@a_range = ($blockStartA, $blockStartA);
	} else {
		@a_range = ($blockStartA..$blockEndA);
	}
	if ($blockStartB eq $blockEndB) {
		@b_range = ($blockStartB, $blockStartB);
	} else {
		@b_range = ($blockStartB..$blockEndB);
	}
	if ($blockStartC eq $blockEndC) {
		@c_range = ($blockStartC, $blockStartC);
	} else {
		@c_range = ($blockStartC..$blockEndC);
	}
	if ($blockStartD eq $blockEndD) {
		@d_range = ($blockStartD, $blockStartD);
	} else {
		@d_range = ($blockStartD..$blockEndD);
	}
	if ($#a_range == 1) {
		push (@a_range, 0);
	}
	if ($#b_range == 1) {
		push (@b_range, 0);
	}
	if ($#c_range == 1) {
		push (@c_range, 0);
	}
	if ($#d_range == 1) {
		push (@d_range, 0);
	}
} else {
	@a_range = (1..126, 128..200);
	@b_range = (0..255);
	@c_range = (0..255);
	@d_range = (0..255);

	for ($j=1;$j<=150;$j++) {
		push (@b_range, "0");
		push (@c_range, "0");
		push (@d_range, "0");
	}
	for ($j=1;$j<=70;$j++) {
		push (@b_range, "4");
		push (@c_range, "4");
		push (@d_range, "4");
	}
	for ($j=1;$j<=70;$j++) {
		push (@b_range, "8");
		push (@c_range, "8");
		push (@d_range, "8");
	}
	for ($j=1;$j<=50;$j++) {
		push (@b_range, "16");
		push (@c_range, "16");
		push (@d_range, "16");
	}
	for ($j=1;$j<=50;$j++) {
		push (@b_range, "32");
		push (@c_range, "32");
		push (@d_range, "32");
	}
	for ($j=1;$j<=50;$j++) {
		push (@b_range, "48");
		push (@c_range, "48");
		push (@d_range, "48");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "64");
		push (@c_range, "64");
		push (@d_range, "64");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "80");
		push (@c_range, "80");
		push (@d_range, "80");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "96");
		push (@c_range, "96");
		push (@d_range, "96");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "112");
		push (@c_range, "112");
		push (@d_range, "112");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "128");
		push (@c_range, "128");
		push (@d_range, "128");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "144");
		push (@c_range, "144");
		push (@d_range, "144");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "160");
		push (@c_range, "160");
		push (@d_range, "160");
	}
	for ($j=1;$j<=30;$j++) {
		push (@b_range, "176");
		push (@c_range, "176");
		push (@d_range, "176");
	}
	for ($j=1;$j<=10;$j++) {
		push (@b_range, "192");
		push (@c_range, "192");
		push (@d_range, "192");
	}
	for ($j=1;$j<=10;$j++) {
		push (@b_range, "208");
		push (@c_range, "208");
		push (@d_range, "208");
	}
}

for ($i=1;$i<=$limit;$i++) {
	if ($aspath) {
		$asString = $aspath;
	} else {
		$numberOfASs = & get_rand_number ($aspaths);
		$numberOfASs = $aspathSpec if ($aspathSpec);
		my %asHash;
		for ($j=1;$j<=$numberOfASs;$j++) {
			$randomAS = & get_rand_as ();
			$asHash{$randomAS} = 1;
		}
		$asString = join (" ", keys (%asHash));
	}

	$a_range = $#a_range;
	$b_range = $#b_range;
	$c_range = $#c_range;
	$d_range = $#d_range;

	$a_range++;
	$b_range++;
	$c_range++;
	$d_range++;

	$a_random_value = & get_rand_number ($a_range);
	$b_random_value = & get_rand_number ($b_range);
	$c_random_value = & get_rand_number ($c_range);
	$d_random_value = & get_rand_number ($d_range);

	$a_random_value--;
	$b_random_value--;
	$c_random_value--;
	$d_random_value--;

	$a_value = $a_range[$a_random_value];
	$b_value = $b_range[$b_random_value];
	$c_value = $c_range[$c_random_value];
	$d_value = $d_range[$d_random_value];

	my %lengthHash;
	$lengthHash{$_} = 1 foreach (@length_range);

	$address = $a_value.".".$b_value.".".$c_value.".".$d_value;

	$block = new Net::Netmask ($address);
	my $minPossible = $block->maxblock();

	if ($minlength > $minPossible) {
		$minPossible = $minlength;
	}
	if ($maxlength < $minPossible) {
		$i--;
		next;
	}

	@length_range = ($minPossible..$maxlength);

	my $length_range_count = $#length_range;
	$length_range_count++;
	$length_random_value = & get_rand_number ($length_range_count);
	$length_random_value--;
	my $selected_length = $length_range[$length_random_value];
	$selected_length = $maxlength if ($selected_length eq '');

	$lengthCounts{$selected_length}++;

	$net = $a_value.'.'.$b_value.'.'.$c_value.'.'.$d_value.'/'.$selected_length;

	if ($doneHash{$net} == 1) {
		$i--;
		next;
	}

	$doneHash{$net} = 1;

	unless ($noaspath) {
		if ($filename) {
			print FILE "set $instanceLine"."routing-options static route $net as-path path \"$asString\"\n";
		} else {
			print "set $instanceLine"."routing-options static route $net as-path path \"$asString\"\n";
		}
	}
	if ($filename) {
		print FILE "set $instanceLine"."routing-options static route $net discard\n";
	} else {
		print "set $instanceLine"."routing-options static route $net discard\n";
	}
}

& policy () if ($doPolicy);

if ($count) {
	my @keys = reverse (sort by_number (keys (%lengthCounts)));
	print "\n";
	print "Route length distribution\n";
	print "--------------------------\n";
	print "/$_: $lengthCounts{$_}\n" foreach (@keys);
}

sub by_number {
    if ($a < $b) {
        return -1;
    } elsif ($a == $b) {
        return 0;
    } elsif ($a > $b) {
        return 1;
    }
}


sub get_rand_number {
	$randLimit = shift;
	my $randomNumber = int(rand($randLimit));
	$randomNumber++ if ($randomNumber == 0);
	return $randomNumber;
}

sub get_rand_as {
	my $randomAS = int(rand(65000));
	$randomAS++ if ($randomAS == 0);
	return $randomAS;
}

sub policy {
	print "\n";
	print "Redistribution policy\n";
	print "----------------------\n";
	print "set policy-options policy-statement redist-static term static from protocol static\n";
	print "set policy-options policy-statement redist-static term static then accept\n";
	print "set policy-options policy-statement redist-static term explicit-reject then reject\n";
	
}


sub bin2dec {
    return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}


sub help {
	print qq*static-route-gen.pl [options]

Create an arbitrary number of static routes for Juniper routers.

Valid options:
  -h|--help			Print (this) help message
  -r|--routes			Number of routes (defaults to 10)
  -a|--aspath			Specify AS path to use (default to random)
  -p|--aspaths			Specify MAXIMUM number of AS hops (defaults to random)
  -e|--saspaths			Specify EXPLICIT number of AS hops
  -l|--long			Specify most specific possible route 
				(bitmask notation defaults to /32)
  -s|--short			Specify least specific possible route
				(bitmask notation, defaults to /4)
  -c|--count			Display route-length distribution summary
  -i|--instance			Specify routing-instance, used for adding routes to VRFs
  -f|--file			Specify file for output (of static routes only)
  -n|--noas			Do not add an AS path to the route
  -o|--policy			Print static route redistribution policy
  -b|--block			Only print routes from the specified netblock

  Examples:
  To print 5 random routes, with random lengths and random as-paths, one would use:
  route-gen.pl -r 5

  To print 5 routes out of a specific block, one would use:
  route-gen.pl -r 5 -b 199.0.65.0/24

  To print 5 routes out of a specific block, with no routes more specific than /27
  one would use:
  route-gen.pl -r 5 -b 199.0.65.0/24 -l 27

  To print 5 random routes with no AS path, one would use:
  route-gen.pl -r 5

  To print 5 routes with a specific AS path, one would use:
  route-gen.pl -r 5 -a "3356 7176"

  To print 5 routes with a specified AS path length, one would use:
  route-gen.pl -r 5 -e 2

  The script does some sanity checking.  For example, if you specify 20 routes
  out of specific /24 block but you don't want anything more specific than
  a /25, the script will lower the total number of routes to 2.  You must also
  use a valid bitmast when you specify a block, so 199.0.65.0/8 will get
  rejected.

  That said, I likely haven't thought of all the places you can mess yourself
  up.

*;
 
	exit 0;
}
