#!/usr/bin/perl

$timeout = $ARGV[0] || 10;
$| = 1;

$SIG{ALRM} = sub { print "alarm\n"; alarm $timeout; };

alarm $timeout;
while(<STDIN>) {
  alarm $timeout;
  print;
}
