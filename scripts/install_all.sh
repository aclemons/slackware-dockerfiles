#!/bin/bash

# MIT License

# Copyright (c) 2019-2023 Andrew Clemons

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -e
set -o pipefail

configure_current() {
  # PRETTY_NAME="Slackware 14.2 arm (post 14.2 -current)"
  if sed -n '/^PRETTY_NAME/p' /etc/os-release | grep post > /dev/null 2>&1 ; then
    touch /var/lib/slackpkg/current
  fi
}

configure_slackpkg() {
  local mirror_base="$1"
  local slackware_dir

  slackware_dir="$(basename "$(sed -n '/^h/p' /etc/slackpkg/mirrors)")"

  mirror="$mirror_base/$slackware_dir/"

  # on linux/386, force the ARCH
  if [ ! -e /usr/lib64 ]; then
    if [ ! -e /etc/os-release ] || ! grep slackware-arm /etc/os-release > /dev/null 2>&1 ; then
      sed -i 's/^#ARCH.*$/ARCH=i386/' /etc/slackpkg/slackpkg.conf
    fi
  fi

  sed -i 's/^\(WGETFLAGS="\)\(.*\)$/\1--quiet \2/' /etc/slackpkg/slackpkg.conf

  if [ -n "$mirror" ] ; then
    echo "Configuring mirror to: $mirror"

    sed -i 's/^h/#xxxh/' /etc/slackpkg/mirrors
    sed -i "/$(printf '%s\n' "$mirror" | sed -e 's/[]\/$*.^[]/\\&/g')/d" /etc/slackpkg/mirrors
    echo "$mirror" >> /etc/slackpkg/mirrors
  fi

  sed -i '/^PRIORITY/s/testing //' /etc/slackpkg/slackpkg.conf
}

# terse package install for installpkg
export TERSE=0

mirror_base="$1"

configure_current
configure_slackpkg "$mirror_base"

slackpkg -default_answer=yes -batch=on update

EXIT_CODE=0
slackpkg -default_answer=yes -batch=on upgrade slackpkg || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

configure_current

if [ -e /etc/slackpkg/slackpkg.conf.new ] ; then
  mv /etc/slackpkg/slackpkg.conf.new /etc/slackpkg/slackpkg.conf

  if [ -e /etc/slackpkg/mirrors.new ] ; then
    old_mirror="$(sed -n '/^h/p' /etc/slackpkg/mirrors)"
    mv /etc/slackpkg/mirrors.new /etc/slackpkg/mirrors
    printf '%s\n' "$old_mirror" >> /etc/slackpkg/mirrors
  fi

  if [ -e /etc/slackpkg/blacklist.new ] ; then
    mv /etc/slackpkg/blacklist.new /etc/slackpkg/blacklist
  fi

  configure_slackpkg "$mirror_base"
fi

# slackpkg tty fixes
# shellcheck disable=SC2016
sed -i 's,SIZE=\$( stty size )$,SIZE=$( [[ $- != *i* ]] \&\& stty size || echo "0 0"),' /usr/libexec/slackpkg/functions.d/post-functions.sh

slackpkg -default_answer=yes -batch=on update

EXIT_CODE=0
slackpkg -default_answer=yes -batch=on upgrade-all || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

sed -i 's/DOWNLOAD_ALL=on/DOWNLOAD_ALL=off/' /etc/slackpkg/slackpkg.conf

for series in a ap d e f k kde l n t tcl x xap xfce y ; do
  slackpkg -default_answer=yes -batch=on install "$series"/* || EXIT_CODE=$?
  if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
    exit $EXIT_CODE
  fi

  rm -rf /var/cache/packages/*
done

slackpkg -default_answer=yes -batch=on install-new || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

EXIT_CODE=0
slackpkg -default_answer=yes -batch=on upgrade-all || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

EXIT_CODE=0
slackpkg -default_answer=yes -batch=on clean-system || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

EXIT_CODE=0
slackpkg -default_answer=yes -batch=on install rust || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

# seems this is a problem sometimes.
EXIT_CODE=0
slackpkg -default_answer=yes -batch=on reinstall ca-certificates || EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then
  exit $EXIT_CODE
fi

sed -i 's/DOWNLOAD_ALL=off/DOWNLOAD_ALL=on/' /etc/slackpkg/slackpkg.conf

find / -xdev -type f -name "*.new" -exec rename ".new" "" {} +

rm -rf /var/cache/packages/*
rm -rf /var/lib/slackpkg/*

configure_current

# slackpkg tty fixes
# shellcheck disable=SC2016
sed -i 's,SIZE=\$( \[\[ \$- != \*i\* \]\] \&\& stty size || echo "0 0"),SIZE=$( stty size ),' /usr/libexec/slackpkg/functions.d/post-functions.sh

if [ -n "$mirror_base" ] ; then
  sed -i '$d' /etc/slackpkg/mirrors
  sed -i 's/^#xxxh/h/' /etc/slackpkg/mirrors
fi

(
  cd /etc
  ln -sf /usr/share/zoneinfo/Etc/GMT localtime
)
