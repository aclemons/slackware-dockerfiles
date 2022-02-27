#!/bin/sh

# Copyright 2019,2022 Andrew Clemons, Wellington New Zealand
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
git checkout 312ffcc5d4d9ce9d17bc53adf2e20887a0fc78b5

cat << 'EOF' | patch -p1
diff --git a/mkimage-slackware.sh b/mkimage-slackware.sh
index d0bd3bf..67c3132 100755
--- a/mkimage-slackware.sh
+++ b/mkimage-slackware.sh
@@ -21,11 +21,9 @@ ROOTFS=${ROOTFS:-"/tmp/rootfs-${RELEASE}"}
 CWD=$(pwd)
 
 base_pkgs="a/aaa_base \
-	a/aaa_elflibs \
 	a/aaa_libraries \
 	a/coreutils \
 	a/glibc-solibs \
-	a/aaa_glibc-solibs \
 	a/aaa_terminfo \
 	a/pam \
 	a/cracklib \
@@ -72,6 +70,24 @@ base_pkgs="a/aaa_base \
 	n/iproute2 \
 	n/openssl"
 
+base_pkgs_legacy="a/aaa_elflibs \
+	a/glibc-solibs"
+base_pkgs_15_0="a/aaa_libraries \
+	a/aaa_glibc-solibs"
+base_pkgs_current="a/aaa_libraries \
+	a/aaa_glibc-solibs"
+
+if [[ "$VERSION" == "current" ]]; then
+  base_pkgs="$base_pkgs_current \
+	$base_pkgs"
+elif [[ "$VERSION" == "15.0" ]]; then
+  base_pkgs="$base_pkgs_15_0 \
+	$base_pkgs"
+else
+  base_pkgs="$base_pkgs_legacy \
+	$base_pkgs"
+fi
+
 function cacheit() {
 	file=$1
 	if [ ! -f "${CACHEFS}/${file}"  ] ; then
@@ -126,7 +142,7 @@ fi
 # an update in upgradepkg during the 14.2 -> 15.0 cycle changed/broke this
 root_env=""
 root_flag="--root /mnt"
-if [ "$VERSION" = "current" ] ; then
+if [ "$VERSION" = "15.0" ] || [ "$VERSION" = "current" ] ; then
 	root_env='ROOT=/mnt'
 	root_flag=''
 fi
@@ -186,7 +202,7 @@ mount --bind /etc/resolv.conf etc/resolv.conf
 PATH=/bin:/sbin:/usr/bin:/usr/sbin \
 chroot . /bin/bash -c 'yes y | /usr/sbin/slackpkg -batch=on -default_answer=y update'
 PATH=/bin:/sbin:/usr/bin:/usr/sbin \
-chroot . /bin/bash -c '/usr/sbin/slackpkg -batch=on -default_answer=y upgrade-all'
+chroot . /bin/bash -c 'EXIT_CODE=0 && { /usr/sbin/slackpkg -batch=on -default_answer=y upgrade-all || EXIT_CODE=$? ; } && if [ $EXIT_CODE -ne 0 ] && [ $EXIT_CODE -ne 20 ] ; then exit $EXIT_CODE ; fi'
 
 # now some cleanup of the minimal image
 set +x
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

RELEASENAME="$RELEASENAME" ARCH="$ARCH" VERSION="$VERSION" bash mkimage-slackware.sh
chown "$CHOWN_TO" "$RELEASENAME-$VERSION.tar"
mv "$RELEASENAME-$VERSION.tar" /data
