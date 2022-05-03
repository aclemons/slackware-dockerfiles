#!/bin/bash

# Copyright 2019 Andrew Clemons, Wellington New Zealand
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

# terse package install for installpkg
export TERSE=0

wget -O - https://github.com/SlackBuildsOrg/slackbuilds/tarball/master | tar xz

export TAG=_jenkins
(
  cd SlackBuildsOrg-slackbuilds-*

  cd system/slackrepo
  # shellcheck disable=SC1091
  . slackrepo.info

  VERSION="$(curl -f  -s -H "Accept: application/json" "https://api.github.com/repos/aclemons/slackrepo/commits?per_page=1" | grep '"sha":' | sed -n 1p | cut -d: -f2 | sed 's/"//g;s/,//g;s/[[:space:]][[:space:]]*//g')"

  # override the version temporarily
  DOWNLOAD="https://github.com/aclemons/slackrepo/archive/$VERSION/slackrepo-$VERSION.tar.gz"

  # shellcheck disable=SC2086
  wget $DOWNLOAD
  VERSION="$VERSION" sh slackrepo.SlackBuild

  cd ../slackrepo-hints
  # shellcheck disable=SC1091
  . slackrepo-hints.info

  VERSION="$(curl -f  -s -H "Accept: application/json" "https://api.github.com/repos/aclemons/slackrepo-hints/commits?per_page=1" | grep '"sha":' | sed -n 1p | cut -d: -f2 | sed 's/"//g;s/,//g;s/[[:space:]][[:space:]]*//g')"

  # override the version temporarily
  DOWNLOAD="https://github.com/aclemons/slackrepo-hints/archive/$VERSION/slackrepo-hints-$VERSION.tar.gz"

  # shellcheck disable=SC2086
  wget $DOWNLOAD
  VERSION="$VERSION" sh slackrepo-hints.SlackBuild
)

rm -rf SlackBuildsOrg-slackbuilds-*

installpkg /tmp/slackrepo-*.t?z

rm -rf /tmp/slackrepo*
rm -rf /tmp/SBo

{
  find /boot -name 'uImage-armv7-*' -print0 | xargs -0 -I {} basename {} | cut -d- -f3-
  find /boot -name 'vmlinuz-generic-smp-*' -print0 | xargs -0 -I {} basename {} | cut -d- -f4-
  find /boot -name 'vmlinuz-generic-*' -print0 | xargs -0 -I {} basename {} | cut -d- -f3-
} | sed -n 1p | sed 's/^/export KERNEL=/' >> /etc/profile

# PRETTY_NAME="Slackware 14.2 arm (post 14.2 -current)"
if sed -n '/^PRETTY_NAME/p' /etc/os-release | grep post > /dev/null 2>&1 ; then
  echo "export OPT_REPO=ponce" >> /etc/profile
else
  echo "export OPT_REPO=SBo" >> /etc/profile
fi
