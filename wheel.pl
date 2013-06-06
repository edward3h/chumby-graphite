#!/usr/bin/perl

$| = 1;

open(FILE, "/dev/input/by-id/soc-noserial-event-joystick");
binmode(FILE);

while(read(FILE, $buf, 16))
{
    ($time1, $time2, $type, $code, $value) = unpack("iissi", $buf);
    if($value != 0) {
        print "wheel $value\n";
    } 
}
