Graphite graphs on Chumby
=========================

These scripts take over a Chumby and use it to display graphs from [Graphite](http://graphite.wikidot.com/)

Installation
------------

Copy the files to a USB stick. Edit the graphite server name in the `draw_graph.pl` file to refer to your
server. Edit the `@target` array in the `draw_graph.pl` file to refer to your graphs.

Plug the USB stick in your Chumby and boot it up!


Files
-----

The script is built on the Unix philosphy of combining small processes that each do one thing.

* debugchumby - normal setup, starts unix pipeline of other commands below
* button_test.pl, event_test.pl - some files I left for testing
* button.pl - outputs the line 'press' each time the button on top of the Chumby is pressed
* wheel.pl - outputs a line 'wheel N' when the wheel on the side of the Chumby is turned. N is usually 1 or -1
* alarm.pl - passes through input lines, and outputs a line 'alarm' if a certain amount of time passes since last 
time any input was seen
* draw_graph.pl - builds the Graphite graph URL, uses `wget` and `imgtool` to get the graph and display it to the screen
