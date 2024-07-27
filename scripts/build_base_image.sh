#!/bin/sh

# MIT License

# Copyright (c) 2019-2024 Andrew Clemons

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

apk add --no-cache wget git bash curl cpio file patch rsync util-linux gpg gpg-agent coreutils

GNUPGHOME="$(mktemp -d)"
export GNUPGHOME

# gpg: key 6A4463C040102233: public key "Slackware Linux Project <security@slackware.com>" imported
gpg --batch --keyserver keyserver.ubuntu.com --recv-keys EC5649DA401E22ABFA6736EF6A4463C040102233
# gpg: key F7ABB8691623FC33: public key "Slackware ARM (Slackware ARM Linux Project) <mozes@slackware.com>" imported
gpg --batch --keyserver keyserver.ubuntu.com --recv-keys 36D376092F129B6B3D59A517F7ABB8691623FC33
# gpg: key 29E6F38E456723FD: public key "ARMedslack Security (ARMedslack Linux Project Security) <security@armedslack.org>" imported
gpg --batch --keyserver keyserver.ubuntu.com --recv-keys 15527425B2329AC5F11E482429E6F38E456723FD

cd /tmp

git clone https://github.com/aclemons/slackware-container.git
cd slackware-container
git checkout 673569891ea0ff58907a11619b22b147b97cde08

RELEASENAME=${RELEASENAME:-}
ARCH=${ARCH:-}
VERSION=${VERSION:-}
CHECKSUMS=${CHECKSUMS:-yes}

if [ -z "$RELEASENAME" ] ; then
  echo "RELEASENAME not set"
  exit 1
fi

if [ -z "$ARCH" ] ; then
  echo "ARCH not set"
  exit 1
fi

if [ -z "$VERSION" ] ; then
  echo "VERSION not set"
  exit 1
fi

# terse package install for installpkg
export TERSE=0

MINIMAL=no CHECKSUMS="$CHECKSUMS" RELEASENAME="$RELEASENAME" ARCH="$ARCH" VERSION="$VERSION" bash mkimage-slackware.sh
chown "$CHOWN_TO" "$RELEASENAME-$VERSION.tar"
mv "$RELEASENAME-$VERSION.tar" /data
