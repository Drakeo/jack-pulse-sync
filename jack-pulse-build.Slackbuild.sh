#!/bin/sh

# Copyright 2012  Patrick J. Volkerding, Sebeka, Minnesota, USA
# All rights reserved.
#
# Copyright 2013 Chess Griffin <chess.griffin@gmail.com> Raleigh, NC
# Copyright 2013 Willy Sudiarto Raharjo <willysr@slackware-id.org>
# All rights reserved.
#
# Based on the xfce-build-all.sh script by Patrick J. Volkerding
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# Set to 1 if you'd like to install/upgrade package as they are built.
# This is recommended. 
top=$(pwd)
SLACKVERS=$(cat /etc/slackware-version)
if [ "$SLACKVERS" = "Slackware 14.2" ]; then
cd jack-pulse
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-14.2/source/l/alsa-plugins .
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-14.2/source/l/pulseaudio .
grep -rli 'TMP=${TMP:-/tmp}' * | xargs -i@ sed -i 's|TMP=${TMP:-/tmp}|TMP=${TMP:-/tmp/jackp}|g' @
elif [ "$SLACKVERS" = "Slackware 14.2+" ]; then
cd jack-pulse
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-current/source/l/alsa-plugins .
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-current/source/l/pulseaudio .
grep -rli 'TMP=${TMP:-/tmp}' * | xargs -i@ sed -i 's|TMP=${TMP:-/tmp}|TMP=${TMP:-/tmp/jackp}|g' @
else
cd jack-pulse
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-current/source/l/alsa-plugins .
rsync -r -a -v  --delete --progress --stats rsync://mirrors.kernel.org/slackware/slackware64-current/source/l/pulseaudio .
grep -rli 'TMP=${TMP:-/tmp}' * | xargs -i@ sed -i 's|TMP=${TMP:-/tmp}|TMP=${TMP:-/tmp/jackp}|g' @
fi
cd $top
INST=1

# This is where all the compilation and final results will be placed
TMP=${TMP:-/tmp/jackp}

# This is the original directory where you started this script
JACKPROOT=$(pwd)

# Loop for all packages
for dir in \
  jack-pulse/set_rlimits \
  jack-pulse/jack2 \
  jack-pulse/qjackctl \
  jack-pulse/pulseaudio \
  jack-pulse/alsa-plugins \
  ; do
  # Get the package name
  package=$(echo $dir | cut -f2- -d /) 
  
  # Change to package directory
  cd $JACKPROOT/$dir || exit 1 

  # The real build starts here
  sh ${package}.SlackBuild || exit 1
  upgradepkg --reinstall --install-new $TMP/$package-*-*.t?z
  
  # back to original directory
  cd $JACKPROOT
done

