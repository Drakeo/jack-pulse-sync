# jack-pulse-sink
scripts to sink pulseaudio and jack2 qjackctl
This is a set of scripts that sink pulseaudio and jack
used with qjackctl for slackware 14.1 14.2

Do not install the
qjackctl from 14.1 it was updated  to build with qt5.
It WELL BREAK all you newer programs that build against qt4 and qt5.
so get the qjacktcl from 14.0 from here 
list of stuff I install.
qjackctl for 14.1 and 14.2 build qjacktcl 0.40
qjackctl for alien bob ktown qjackctl-qt5 0.41
seems people have no clue how ldconfig works in slackware.
so had to do it this way. 14.1 will be under updates for many years to come
and 14.2 is coming out and will be under updates for even longer.
God nows why some one at SlackBuilds thinks we need to spend 2 hours compiling qt5 
just to break our system. It is Nuts. 

jack2  // for multi threading

qjackctl 0.4.0 //for slackware 14.0 14.1 14.2 qt4

set_rlimits // note my example

there are many other programs you can
install but these are the base.

The four scripts can beplaced in
/usr/local/bin

or in any local folder.
make sure they are executable chmod u+x name
after you have installed the programs
you want to look at my examples of set_rlimits.
works prety good with the slackware stock kernel.
