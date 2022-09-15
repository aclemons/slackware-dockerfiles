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
diff --git a/get_paths.sh b/get_paths.sh
index a86fdf6..c3052a1 100755
--- a/get_paths.sh
+++ b/get_paths.sh
@@ -12,7 +12,7 @@ _usage() {
 }
 
 _release_base() {
-    echo "${1}" | cut -d - -f 1
+    echo "${1}" | cut -d - -f 1 | sed 's/slackwarearm/slackware/;s/slackwareaarch64/slackware/'
 }
 
 _fetch_file_list() {
@@ -77,7 +77,7 @@ main() {
         esac
     done
     shift $((OPTIND-1))
-    
+
     tmp_dir="$(mktemp -d)"
     tmp_file_list="${tmp_dir}/FILE_LIST"
     _fetch_file_list "${mirror}" "${release}" > "${tmp_file_list}"
diff --git a/mkimage-slackware.sh b/mkimage-slackware.sh
index b71af3e..616e0a4 100755
--- a/mkimage-slackware.sh
+++ b/mkimage-slackware.sh
@@ -15,7 +15,13 @@ BUILD_NAME=${BUILD_NAME:-"slackware"}
 VERSION=${VERSION:="current"}
 RELEASENAME=${RELEASENAME:-"slackware${ARCH}"}
 RELEASE=${RELEASE:-"${RELEASENAME}-${VERSION}"}
-MIRROR=${MIRROR:-"http://slackware.osuosl.org"}
+if [ -z "$MIRROR" ]; then
+  if [ "$ARCH" = "arm" ] ; then
+    MIRROR="http://slackware.uk/slackwarearm"
+  else
+    MIRROR="http://slackware.osuosl.org"
+  fi
+fi
 CACHEFS=${CACHEFS:-"/tmp/${BUILD_NAME}/${RELEASE}"}
 ROOTFS=${ROOTFS:-"/tmp/rootfs-${RELEASE}"}
 CWD=$(pwd)
@@ -88,16 +94,28 @@ function cacheit() {
 
 mkdir -p $ROOTFS $CACHEFS
 
-cacheit "isolinux/initrd.img"
+if [ -z "$INITRD" ]; then
+  if [ "$ARCH" = "arm" ] ; then
+    case "$VERSION" in
+      11*|12*|13*|14.0|14.1) INITRD=initrd-versatile.img ;;
+      14.2|15.0) INITRD=initrd-armv7.img ;;
+      *) INITRD=initrd-armv8.img ;;
+    esac
+  else
+    INITRD=${INITRD:-initrd.img}
+  fi
+fi
+
+cacheit "isolinux/$INITRD"
 
 cd $ROOTFS
 # extract the initrd to the current rootfs
 ## ./slackware64-14.2/isolinux/initrd.img:    gzip compressed data, last modified: Fri Jun 24 21:14:48 2016, max compression, from Unix, original size 68600832
 ## ./slackware64-current/isolinux/initrd.img: XZ compressed data
-if $(file ${CACHEFS}/isolinux/initrd.img | grep -wq XZ) ; then
-	xzcat "${CACHEFS}/isolinux/initrd.img" | cpio -idvm --null --no-absolute-filenames
+if file ${CACHEFS}/isolinux/$INITRD | grep -wq XZ ; then
+	xzcat "${CACHEFS}/isolinux/$INITRD" | cpio -idvm --null --no-absolute-filenames
 else
-	zcat "${CACHEFS}/isolinux/initrd.img" | cpio -idvm --null --no-absolute-filenames
+	zcat "${CACHEFS}/isolinux/$INITRD" | cpio -idvm --null --no-absolute-filenames
 fi
 
 if stat -c %F $ROOTFS/cdrom | grep -q "symbolic link" ; then
@@ -129,15 +147,20 @@ fi
 
 # an update in upgradepkg during the 14.2 -> 15.0 cycle changed/broke this
 root_env=""
-root_flag="--root /mnt"
+root_flag=""
+if [ -f ./sbin/upgradepkg ] && grep -qw -- '"--root"' ./sbin/upgradepkg ; then
+	root_flag="--root /mnt"
+elif [ -f ./usr/lib/setup/installpkg ] && grep -qw -- '"-root"' ./usr/lib/setup/installpkg ; then
+	root_flag="-root /mnt"
+fi
 if [ "$VERSION" = "current" ] || [ "${VERSION}" = "15.0" ]; then
 	root_env='ROOT=/mnt'
 	root_flag=''
 fi
 
-relbase=$(echo ${RELEASE} | cut -d- -f1)
+relbase=$(echo ${RELEASE} | cut -d- -f1 | sed 's/slackwarearm/slackware/;s/slackwareaarch64/slackware/')
 if [ ! -f ${CACHEFS}/paths ] ; then
-	bash ${CWD}/get_paths.sh -r ${RELEASE} > ${CACHEFS}/paths
+	bash ${CWD}/get_paths.sh -r ${RELEASE} -m ${MIRROR} > ${CACHEFS}/paths
 fi
 for pkg in ${base_pkgs}
 do
@@ -165,15 +188,15 @@ do
 done
 
 cd mnt
+chroot . /sbin/ldconfig
 set -x
 touch etc/resolv.conf
-echo "export TERM=linux" >> etc/profile.d/term.sh
-chmod +x etc/profile.d/term.sh
-echo ". /etc/profile" > .bashrc
-echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
-sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
-sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
-sed -i 's/SPINNING=on/SPINNING=off/' etc/slackpkg/slackpkg.conf
+if [ -e etc/slackpkg/mirrors ] ; then
+  echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
+  sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
+  sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
+  sed -i 's/SPINNING=on/SPINNING=off/' etc/slackpkg/slackpkg.conf
+fi
 
 if [ ! -f etc/rc.d/rc.local ] ; then
 	mkdir -p etc/rc.d
@@ -191,6 +214,8 @@ mount --bind /etc/resolv.conf etc/resolv.conf
 # for slackware 15.0, slackpkg return codes are now:
 # 0 -> All OK, 1 -> something wrong, 20 -> empty list, 50 -> Slackpkg upgraded, 100 -> no pending updates
 chroot_slackpkg() {
+  PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+  chroot . /bin/bash -c '/sbin/ldconfig'
 	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
 	chroot . /bin/bash -c 'yes y | /usr/sbin/slackpkg -batch=on -default_answer=y update'
 	ret=0
@@ -205,14 +230,12 @@ chroot_slackpkg() {
 		return $?
 	fi
 }
-chroot_slackpkg
+if [ -e etc/slackpkg/mirrors ] ; then
+  chroot_slackpkg
+fi
 
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
