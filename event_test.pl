#!/usr/bin/perl

open(FILE, shift);
binmode(FILE);

while(read(FILE, $buf, 16))
{
    ($time1, $time2, $type, $code, $value) = unpack("iissi", $buf);
    printf("%f %05d %05d %08d\n", $time1+$time2/1000000, $type, $code, $value);
}
