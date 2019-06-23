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

git clone --depth 1 https://github.com/aclemons/slackbuilds.org.git -b 14.2_acl

export TAG=_jenkins
(
  cd slackbuilds.org

  cd system/slackrepo
  # shellcheck disable=SC1091
  . slackrepo.info

  # shellcheck disable=SC2086
  wget $DOWNLOAD
  sh slackrepo.SlackBuild

  cd ../slackrepo-hints
  # shellcheck disable=SC1091
  . slackrepo-hints.info

  # shellcheck disable=SC2086
  wget $DOWNLOAD
  sh slackrepo-hints.SlackBuild
)

rm -rf slackbuilds.org

installpkg /tmp/slackrepo-*.t?z

rm -rf /tmp/slackrepo*
rm -rf /tmp/SBo

(
  cd  /usr/local/bin
  wget https://raw.githubusercontent.com/aclemons/slackrepo-jenkins/28b9b80ccbc332b54d7f1010207897d91b23bd88/slackrepo_parse.rb
  chmod +x slackrepo_parse.rb
)

{
  find /boot -name 'uImage-armv7-*' -print0 | xargs -0 -I {} basename {} | cut -d- -f3-
  find /boot -name 'vmlinuz-generic-*' -print0 | xargs -0 -I {} basename {} | cut -d- -f3-
} | sed 's/^/export KERNEL=/' >> /etc/profile

# PRETTY_NAME="Slackware 14.2 arm (post 14.2 -current)"
if sed -n '/^PRETTY_NAME/p' /etc/os-release | grep post > /dev/null 2>&1 ; then
  echo "export OPT_REPO=ponce" >> /etc/profile
else
  echo "export OPT_REPO=SBo" >> /etc/profile
fi
