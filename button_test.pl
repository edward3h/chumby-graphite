#!/usr/bin/perl

open(FILE, "/dev/input/by-id/soc-noserial-event-kbd");
binmode(FILE);

while(read(FILE, $buf, 16))
{
    ($time1, $time2, $type, $code, $value) = unpack("iissi", $buf);
    printf("%f %05d %05d 0x%08x\n", $time1+$time2/1000000, $type, $code, $value);
}
