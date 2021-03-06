#!/bin/bash

# Copyright 2019,2021 Andrew Clemons, Wellington New Zealand
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

wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt.asc
wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt
gpg --verify slackarm-14.2-miniroot_details.txt.asc slackarm-14.2-miniroot_details.txt

wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/$(sed -n '/slackarm-14.2-miniroot_/p' slackarm-14.2-miniroot_details.txt | awk '{ print $2 }')"
sha1sum --check <(sed -n '/miniroot_/p' slackarm-14.2-miniroot_details.txt)

cp /usr/bin/qemu-arm-static .

for package in ap/diffutils-3.3-arm-2.txz n/gnupg-1.4.20-arm-1.txz l/libunistring-0.9.3-arm-2.txz ; do
  wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-14.2/slackware/$package"
  wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-14.2/slackware/$package.asc"

  package=${package##*/}
  gpg --verify "$package.asc" "$package"
done
