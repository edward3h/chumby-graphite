#!/usr/bin/perl

my $render = '/tmp/images/render.png';
my $baseurl = 'http://graphite-server/render?height=240&width=320&yMin=0&yMinRight=0&yMinLeft=0&fontBold=true&fgcolor=00FF00&fontName=Sans&fontSize=8&hideLegend=true';
my @hours = (1, 2, 4, 6, 12, 24, 48, 96, 168);
my $hourselection = 3;
my @target = (
'&target=sumSeries(service.request)&title=Service Requests',
'&target=divideSeries(sumSeries(service.time),sumSeries(service.request))&title=Service Request Time (ms)',
'&target=sumSeries(service.big_counter)&target=secondYAxis(sumSeries(service.small_counter))&title=Service Counters'
);
my $selection = 0;

# initial draw
$h = $hours[$hourselection];
$t = $target[$selection % @target];
$url = "${baseurl}&from=-${h}h${t}";
system("wget -O ${render} '${url}' && imgtool --mode=draw ${render}");

while(<STDIN>) {
  if(/press/) {
    $selection++;
  }
  elsif(/wheel\s+(-?\d+)/) {
    $hourselection += $1;
    $hourselection = 0 if $hourselection < 0;
    $hourselection = @hours - 1 if $hourselection >= @hours;
  }
  $h = $hours[$hourselection];
  $t = $target[$selection % @target];
  $url = "${baseurl}&from=-${h}h${t}";
  system("wget -O ${render} '${url}' && imgtool --mode=draw ${render}");
}
