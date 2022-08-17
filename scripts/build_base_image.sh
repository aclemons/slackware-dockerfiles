#!/bin/sh

# Copyright 2019,2022 Andrew Clemons, Wellington New Zealand
# Copyright 2022 Andrew Clemons, Tokyo Japan
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

apk add --no-cache wget git bash curl cpio file patch

cd /tmp

git clone https://github.com/vbatts/slackware-container.git
cd slackware-container
git checkout ba93a9dc82270a90d19abefda0019d7e607183ea

cat << 'EOF' | patch -p1
diff --git a/mkimage-slackware.sh b/mkimage-slackware.sh
index b71af3e..88bfd98 100755
--- a/mkimage-slackware.sh
+++ b/mkimage-slackware.sh
@@ -167,9 +167,6 @@ done
 cd mnt
 set -x
 touch etc/resolv.conf
-echo "export TERM=linux" >> etc/profile.d/term.sh
-chmod +x etc/profile.d/term.sh
-echo ". /etc/profile" > .bashrc
 echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
 sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
 sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
@@ -207,12 +204,8 @@ chroot_slackpkg() {
 }
 chroot_slackpkg
 
-# now some cleanup of the minimal image
 set +x
 rm -rf var/lib/slackpkg/*
-rm -rf usr/share/locale/*
-rm -rf usr/man/*
-find usr/share/terminfo/ -type f ! -name 'linux' -a ! -name 'xterm' -a ! -name 'screen.linux' -exec rm -f "{}" \;
 umount $ROOTFS/dev
 rm -f dev/* # containers should expect the kernel API (`mount -t devtmpfs none /dev`)
 umount etc/resolv.conf
EOF

RELEASENAME=${RELEASENAME:-}
ARCH=${ARCH:-}
VERSION=${VERSION:-}

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

RELEASENAME="$RELEASENAME" ARCH="$ARCH" VERSION="$VERSION" bash mkimage-slackware.sh
chown "$CHOWN_TO" "$RELEASENAME-$VERSION.tar"
mv "$RELEASENAME-$VERSION.tar" /data
