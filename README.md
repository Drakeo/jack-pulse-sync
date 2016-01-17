# jack-pulse-sink
scripts to sink pulseaudio and jack2 qjackctl
This is a set of scripts that sink pulseaudio and jack
used with qjackctl for slackware 14.1 14.2

Do not install the
qjackctl from 14.1 it was updated  to build with qt5.
It WELL BREAK all you newer programs that build against qt4 and qt5.
so get the qjacktcl from 14.0 from here 
list of stuff I install.

opus

jack2  // for multi threading

qjackctl 3.9 //for slackware qt4

set_rlimits // not my example

there are many other programs you can
install but these are the base.

The four scripts can beplaced in
/usr/local/bin

or in any local folder.
make sure they are executable chmod x+ name
after you have installed the programs
you want to look at my examples of set_rlimits.
works prety good with the slackware stock kernel.
