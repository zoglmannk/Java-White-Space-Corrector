#!/usr/bin/perl

# how to use this program in conjunction with bash
# issue the commands from the base of the code base
# find * | grep \\.java$ | xargs -IXX /Users/kaz/tmp/tabs2spaces/tabs2spaces.pl XX
# find * | grep \\.java+$ | xargs -IXX bash -c 'Z=XX; mv $Z ${Z:0:$((${#Z}-1))}'

$read_fn = $ARGV[0];
$write_fn = "$ARGV[0]+";
print "reading in file: ".$read_fn . "\n";
print "writing to file: ".$write_fn . "\n";

open (RFILE, $read_fn);
open (WFILE, ">$write_fn");

while(<RFILE>) {
  $line = $_;

  if($line =~ m/^([\s\t]+?)([^\s\t]+.*)$/) {
    $white_space = $1;
    $rest_of_line = $2;

    $white_space =~ s/\t/    /g; #convert tab to 4 spaces

    $line = $white_space . $rest_of_line . "\n";
    #print "w:'".$white_space."'";
    #print "r:'".$rest_of_line."'\n";

  } elsif ($line =~ m/^([\s\t]*?\t+[\s\t]*?)$/) {
    print "got here... $1\n";
    $white_space = $1;

    $white_space =~ s/\t/    /g; #convert table to 4 spaces
    $line = $white_space . "\n";

  } else {
    #print "non match: ".$line
  }

  print WFILE $line;
}

close(WFILE);
close(RFILE);
