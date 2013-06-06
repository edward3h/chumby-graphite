#!/usr/bin/perl

$| = 1;

open(FILE, "/dev/input/by-id/soc-noserial-event-kbd");
binmode(FILE);

while(read(FILE, $buf, 16))
{
    ($time1, $time2, $type, $code, $value) = unpack("iissi", $buf);
    print "press\n" if $value;
}
