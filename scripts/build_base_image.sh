#!/bin/sh

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
index b71af3e..b364e2d 100755
--- a/mkimage-slackware.sh
+++ b/mkimage-slackware.sh
@@ -7,6 +7,7 @@ if [ -z "$ARCH" ]; then
   case "$( uname -m )" in
     i?86) ARCH="" ;;
     arm*) ARCH=arm ;;
+ aarch64) ARCH=aarch64 ;;
        *) ARCH=64 ;;
   esac
 fi
@@ -15,7 +16,13 @@ BUILD_NAME=${BUILD_NAME:-"slackware"}
 VERSION=${VERSION:="current"}
 RELEASENAME=${RELEASENAME:-"slackware${ARCH}"}
 RELEASE=${RELEASE:-"${RELEASENAME}-${VERSION}"}
-MIRROR=${MIRROR:-"http://slackware.osuosl.org"}
+if [ -z "$MIRROR" ]; then
+  if [ "$ARCH" = "arm" ] || [ "$ARCH" = "aarch64" ] ; then
+    MIRROR="http://slackware.uk/slackwarearm"
+  else
+    MIRROR="http://slackware.osuosl.org"
+  fi
+fi
 CACHEFS=${CACHEFS:-"/tmp/${BUILD_NAME}/${RELEASE}"}
 ROOTFS=${ROOTFS:-"/tmp/rootfs-${RELEASE}"}
 CWD=$(pwd)
@@ -88,16 +95,29 @@ function cacheit() {
 
 mkdir -p $ROOTFS $CACHEFS
 
-cacheit "isolinux/initrd.img"
+if [ -z "$INITRD" ]; then
+  if [ "$ARCH" = "arm" ] ; then
+    case "$VERSION" in
+      11*|12*|13*|14.0|14.1) INITRD=initrd-versatile.img ;;
+      *) INITRD=initrd-armv7.img ;;
+    esac
+  elif [ "$ARCH" = "aarch64" ] ; then
+    INITRD=initrd-armv8.img
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
@@ -129,15 +149,20 @@ fi
 
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
@@ -165,15 +190,27 @@ do
 done
 
 cd mnt
+PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+chroot . /bin/sh -c '/sbin/ldconfig'
+
+if [ ! -e ./root/.gnupg ] ; then
+  cacheit "GPG-KEY"
+  cp ${CACHEFS}/GPG-KEY .
+  echo PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+       chroot . /usr/bin/gpg --import GPG-KEY
+  PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+      chroot . /usr/bin/gpg --import GPG-KEY
+ rm GPG-KEY
+fi
+
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
@@ -193,26 +230,34 @@ mount --bind /etc/resolv.conf etc/resolv.conf
 chroot_slackpkg() {
 	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
 	chroot . /bin/bash -c 'yes y | /usr/sbin/slackpkg -batch=on -default_answer=y update'
+	chroot . /bin/bash -c '/usr/sbin/slackpkg -batch=on -default_answer=y upgrade slackpkg || true'
+	if [ -e etc/slackpkg/mirrors.new ] ; then
+		mv etc/slackpkg/mirrors.new etc/slackpkg/mirrors
+		echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
+	fi
+	if [ -e etc/slackpkg/slackpkg.conf.new ] ; then
+		mv etc/slackpkg/slackpkg.conf.new etc/slackpkg/slackpkg.conf
+		sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
+		sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
+		sed -i 's/SPINNING=on/SPINNING=off/' etc/slackpkg/slackpkg.conf
+	fi
+	chroot . /bin/bash -c 'yes y | /usr/sbin/slackpkg -batch=on -default_answer=y update'
 	ret=0
 	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
 	chroot . /bin/bash -c '/usr/sbin/slackpkg -batch=on -default_answer=y upgrade-all' || ret=$?
 	if [ $ret -eq 0 ] || [ $ret -eq 20 ] ; then
-		echo "uprade-all is OK"
+		echo "upgrade-all is OK"
 		return
-	elif [ $ret -eq 50 ] ; then
-		chroot_slackpkg
 	else
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
