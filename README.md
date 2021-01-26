# jack-pulse-sink
scripts to sink pulseaudio and jack2 qjackctl
This is a set of scripts that sink pulseaudio and jack
used with qjackctl for slackware  14.2 14.2+ current

Do not install the
qjackctl from 14.1 it was updated  to build with qt5.
It WELL BREAK all you newer programs that build against qt4 and qt5.
list of stuff I install.

For Slackware-14.2 and 14.2+ current
run as root
sh jack-pulse-build.Slackbuild.sh
will detect your slackware version and rebuild 
alsa-plugins and pulseaudio

 
just to break our system. It is Nuts. 


jack2  // for multi threading
will detect your slackware version 
compile 14.2 qt4 or 14.2+ 15.0 current qt5

qjackctl 0.4.0 //for slackware 14.0 14.1 14.2 qt4
qjackctl 0.9.0 //for slackware current 15.0 qt5

set_rlimits // note my example
set_rlimits already in menu now
no need to edit

there are many other programs you can
install but these are the base.

The four scripts installed in
/usr/share/qjackctl/pulse-jack-scripts/

