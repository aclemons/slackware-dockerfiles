#!/bin/bash

# MIT License

# Copyright (c) 2019-2022 Andrew Clemons

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
