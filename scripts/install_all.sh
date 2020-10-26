#!/bin/bash

# Copyright 2019-2020 Andrew Clemons, Wellington New Zealand
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

set -e
set -o pipefail

base_image="$1"
local_mirror="$2"

echo "Using base_image=$base_image, local_mirror=$local_mirror"

if [ "$base_image" = "vbatts/slackware:current" ] || [ "$base_image" = "aclemons/slackware:current_arm_base" ] || [ "$base_image" = "aclemons/slackware:current_x86_base" ] ; then
  touch /var/lib/slackpkg/current
fi

if ! grep ^ARCH /etc/slackpkg/slackpkg.conf > /dev/null ; then
  if [ ! -e /usr/lib64 ] ; then
    sed -i 's/^#ARCH.*$/ARCH=i386/' /etc/slackpkg/slackpkg.conf
  fi
fi

sed -i 's/^\(WGETFLAGS="\)\(.*\)$/\1--quiet \2/' /etc/slackpkg/slackpkg.conf

if [ -e "$local_mirror" ] ; then
  sed -i "s,^# file.*$,file:/$local_mirror/," /etc/slackpkg/mirrors
  sed -i 's/^h/# h/' /etc/slackpkg/mirrors
fi

sed -i '/^PRIORITY/s/extra //' /etc/slackpkg/slackpkg.conf
sed -i '/^PRIORITY/s/patches /patches extra /' /etc/slackpkg/slackpkg.conf

slackpkg -default_answer=yes -batch=on update
slackpkg -default_answer=yes -batch=on upgrade slackpkg
slackpkg -default_answer=yes -batch=on update

if [ "$base_image" = "vbatts/slackware:current" ] || [ "$base_image" = "aclemons/slackware:current_x86_base" ]; then
  slackpkg -default_answer=yes -batch=on install pcre2 libpsl
fi

slackpkg -default_answer=yes -batch=on upgrade-all
slackpkg -default_answer=yes -batch=on install a/* ap/* d/* e/* f/* k/* kde/* l/* n/* t/* tcl/* x/* xap/* xfce/* y/*
slackpkg -default_answer=yes -batch=on install-new
slackpkg -default_answer=yes -batch=on upgrade-all
slackpkg -default_answer=yes -batch=on clean-system
slackpkg -default_answer=yes -batch=on install rust
slackpkg -default_answer=yes -batch=on new-config

if [ "$base_image" = "vbatts/slackware:current" ] || [ "$base_image" = "aclemons/slackware:current_x86_base" ]; then
  slackpkg -default_answer=yes -batch=on reinstall ca-certificates
fi

rm -rf /var/cache/packages/*
