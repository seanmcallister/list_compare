#!/usr/bin/perl
use strict;
use Getopt::Std;

# - - - - - H E A D E R - - - - - - - - - - - - - - - - -
#Goals of script:
#Compare two lists via regex matching. Output files with matches and no matches.


# - - - - - U S E R    V A R I A B L E S - - - - - - - -


# - - - - - G L O B A L  V A R I A B L E S  - - - - - -
my %options=();
getopts("h1:2:", \%options);

if ($options{h})
    {   print "\n\nHelp called:\nOptions:\n";
	print "-1 = First infile\n-2 = Second infile\n-h = This help screen\n\n";
	die;
    }

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - M A I N - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


##### 1. Store file 1 in array @file1
print "\n\nOpening file 1: $options{1}";
open(IN,"<$options{1}") or die "\n\nError, there is no file named $options{1}.\n\n";
my @file1 = <IN>;
close(IN);
chomp(@file1);
print "\n\n*****DONE*****\n\n";

##### 2. Store file 2 in array @file2
print "\n\nOpening file 2: $options{2}";
open(IN,"<$options{2}") or die "\n\nError, there is no file named $options{2}.\n\n";
my @file2 = <IN>;
close(IN);
chomp(@file2);
print "\n\n*****DONE*****\n\n";


##### 3. Output three files: match, missingfrom1, missingfrom2
open(OUT1, ">match.txt");
open(OUT2, ">missingfrom2.txt");
open(OUT3, ">missingfrom1.txt");
foreach my $first (@file1)
    {	my $hit = "F";
	foreach my $second (@file2)
	{	if ($first eq $second)
		    {	print OUT1 "$first\n";
			$hit = "T";
		    }
	}
	if ($hit eq "F")
	    {	print OUT2 "$first\n";}
    }
foreach my $second (@file2)
    {	my $hit = "F";
	foreach my $first (@file1)
	{	if ($second eq $first)
		    {$hit = "T";}
	}
	if ($hit eq "F")
	    {	print OUT3 "$second\n";}
    }
close(OUT1);
close(OUT2);
close(OUT3);

print "\n\n* * * * * * * * D O N E * * * * * * * *\n\n";

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - S U B R O U T I N E S - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# - - - - - EOF - - - - - - - - - - - - - - - - - - - - - -
