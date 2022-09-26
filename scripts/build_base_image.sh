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

apk add --no-cache wget git bash curl cpio file patch rsync util-linux

cd /tmp

git clone https://github.com/vbatts/slackware-container.git
cd slackware-container
git checkout aef9920fae86a9a79247eed19932f7c871d29c70

cat << 'EOF' | patch -p1
diff --git a/get_paths.sh b/get_paths.sh
index a86fdf6..914798c 100755
--- a/get_paths.sh
+++ b/get_paths.sh
@@ -12,15 +12,16 @@ _usage() {
 }
 
 _release_base() {
-    echo "${1}" | cut -d - -f 1
+    echo "${1}" | cut -d - -f 1 | sed 's/armedslack/slackware/;s/slackwarearm/slackware/;s/slackwareaarch64/slackware/'
 }
 
 _fetch_file_list() {
     local mirror="${1}"
     local release="${2}"
+    local directory="${3}"
     local ret
 
-    curl -sSL "${mirror}/${release}/$(_release_base "${release}")/FILE_LIST"
+    curl -sSL "${mirror}/${release}/${directory}/FILE_LIST"
     ret=$?
     if [ $ret -ne 0 ] ; then
         return $ret
@@ -59,7 +60,7 @@ main() {
     mirror="${MIRROR:-http://slackware.osuosl.org}"
     release="${RELEASE:-slackware64-current}"
 
-    while getopts ":hm:r:t" opts ; do
+    while getopts ":hm:r:tpe" opts ; do
         case "${opts}" in
             m)
                 mirror="${OPTARG}"
@@ -70,6 +71,12 @@ main() {
             t)
                 fetch_tagfiles=1
                 ;;
+            p)
+                fetch_patches=1
+                ;;
+            e)
+                fetch_extra=1
+                ;;
             *)
                 _usage
                 exit 1
@@ -77,16 +84,32 @@ main() {
         esac
     done
     shift $((OPTIND-1))
-    
+
     tmp_dir="$(mktemp -d)"
     tmp_file_list="${tmp_dir}/FILE_LIST"
-    _fetch_file_list "${mirror}" "${release}" > "${tmp_file_list}"
-    ret=$?
-    if [ $ret -ne 0 ] ; then
-        echo "ERROR fetching FILE_LIST" >&2
-        exit $ret
+    if [ -n "${fetch_patches}" ] ; then
+        _fetch_file_list "${mirror}" "${release}" "patches" >> "${tmp_file_list}"
+        ret=$?
+        if [ $ret -ne 0 ] ; then
+            echo "ERROR fetching FILE_LIST" >&2
+            exit $ret
+        fi
+    elif [ -n "${fetch_extra}" ] ; then
+        _fetch_file_list "${mirror}" "${release}" "extra" >> "${tmp_file_list}"
+        ret=$?
+        if [ $ret -ne 0 ] ; then
+            echo "ERROR fetching FILE_LIST" >&2
+            exit $ret
+        fi
+    else
+        _fetch_file_list "${mirror}" "${release}" "$(_release_base "${release}")" > "${tmp_file_list}"
+        ret=$?
+        if [ $ret -ne 0 ] ; then
+            echo "ERROR fetching FILE_LIST" >&2
+            exit $ret
+        fi
     fi
-    
+
     if [ -n "${fetch_tagfiles}" ] ; then
         for section in $(_sections_from_file_list "${tmp_file_list}") ; do
             mkdir -p "${tmp_dir}/${section}"
@@ -97,8 +120,8 @@ main() {
             fi
         done
     fi
-    
-    grep '\.t.z$' "${tmp_file_list}" | awk '{ print $8 }' | sed -e 's|\./\(.*\.t.z\)$|\1|g'
+
+    grep '\.t.z$' "${tmp_file_list}" | awk '{ print $(NF) }' | sed -e 's|\./\(.*\.t.z\)$|\1|g'
 }
 
 _is_sourced || main "${@}"
diff --git a/mkimage-slackware.sh b/mkimage-slackware.sh
index 3c7a17d..8f27602 100755
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
@@ -15,18 +16,27 @@ BUILD_NAME=${BUILD_NAME:-"slackware"}
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
+MINIMAL=${MINIMAL:-no}
 CWD=$(pwd)
 
 base_pkgs="a/aaa_base \
+	a/elflibs \
 	a/aaa_elflibs \
 	a/aaa_libraries \
 	a/coreutils \
 	a/glibc-solibs \
 	a/aaa_glibc-solibs \
 	a/aaa_terminfo \
+	a/fileutils \
 	a/pam \
 	a/cracklib \
 	a/libpwquality \
@@ -39,12 +49,15 @@ base_pkgs="a/aaa_base \
 	a/bash \
 	a/etc \
 	a/gzip \
+	a/textutils \
 	l/pcre2 \
 	l/libpsl \
+	l/libusb \
 	n/wget \
 	n/gnupg \
 	a/elvis \
 	ap/slackpkg \
+	slackpkg-0.99 \
 	l/ncurses \
 	a/bin \
 	a/bzip2 \
@@ -78,6 +91,11 @@ base_pkgs="a/aaa_base \
 	n/iproute2 \
 	n/openssl"
 
+if [ "$VERSION" = "15.0" ] && [ "$ARCH" = "arm" ] ; then
+	base_pkgs="installer_fix \
+	$base_pkgs"
+fi
+
 function cacheit() {
 	file=$1
 	if [ ! -f "${CACHEFS}/${file}"  ] ; then
@@ -90,16 +108,41 @@ function cacheit() {
 
 mkdir -p $ROOTFS $CACHEFS
 
-cacheit "isolinux/initrd.img"
+if [ -z "$INITRD" ]; then
+	if [ "$ARCH" = "arm" ] ; then
+		case "$VERSION" in
+			12*|13*|14.0|14.1) INITRD=initrd-versatile.img ;;
+			*) INITRD=initrd-armv7.img ;;
+		esac
+	elif [ "$ARCH" = "aarch64" ] ; then
+		INITRD=initrd-armv8.img
+	else
+		INITRD=initrd.img
+	fi
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
+	zcat "${CACHEFS}/isolinux/$INITRD" > ${CACHEFS}/isolinux/$INITRD.decompressed
+	if file ${CACHEFS}/isolinux/$INITRD.decompressed | grep -wq cpio ; then
+		< "${CACHEFS}/isolinux/$INITRD".decompressed cpio -idvm --null --no-absolute-filenames
+	else
+		mkdir -p $ROOTFS.mnt
+		mount -o loop ${CACHEFS}/isolinux/$INITRD.decompressed $ROOTFS.mnt
+		rsync -aAXHv $ROOTFS.mnt/ $ROOTFS
+		umount $ROOTFS.mnt
+		rm -rf $ROOTFS.mnt
+		if [ -e bin/gzip.bin ] ; then
+			(cd bin && ln -sf gzip.bin gzip)
+		fi
+	fi
 fi
 
 if stat -c %F $ROOTFS/cdrom | grep -q "symbolic link" ; then
@@ -131,25 +174,63 @@ fi
 
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
+relbase=$(echo ${RELEASE} | cut -d- -f1 | sed 's/armedslack/slackware/;s/slackwarearm/slackware/;s/slackwareaarch64/slackware/')
 if [ ! -f ${CACHEFS}/paths ] ; then
-	bash ${CWD}/get_paths.sh -r ${RELEASE} > ${CACHEFS}/paths
+	bash ${CWD}/get_paths.sh -r ${RELEASE} -m ${MIRROR} > ${CACHEFS}/paths
+fi
+if [ ! -f ${CACHEFS}/paths-patches ] ; then
+	bash ${CWD}/get_paths.sh -r ${RELEASE} -m ${MIRROR} -p > ${CACHEFS}/paths-patches
+fi
+if [ ! -f ${CACHEFS}/paths-extra ] ; then
+	bash ${CWD}/get_paths.sh -r ${RELEASE} -m ${MIRROR} -e > ${CACHEFS}/paths-extra
 fi
 for pkg in ${base_pkgs}
 do
-	path=$(grep ^${pkg} ${CACHEFS}/paths | cut -d : -f 1)
+	installer_fix=false
+	if [ "$pkg" = "installer_fix" ] ; then
+		# see slackwarearm-15.0 ChangeLog entry from Thu Sep 15 08:08:08 UTC 2022
+		installer_fix=true
+		pkg=a/aaa_glibc-solibs
+	fi
+	path=$(grep "^packages/$(basename "${pkg}")-" ${CACHEFS}/paths-patches | cut -d : -f 1)
 	if [ ${#path} -eq 0 ] ; then
-		echo "$pkg not found"
-		continue
+		path=$(grep ^${pkg}- ${CACHEFS}/paths | cut -d : -f 1)
+		if [ ${#path} -eq 0 ] ; then
+			path=$(grep "^$(basename "${pkg}")/$(basename "${pkg}")-" ${CACHEFS}/paths-extra | cut -d : -f 1)
+			if [ ${#path} -eq 0 ] ; then
+				echo "$pkg not found"
+				continue
+			else
+				l_pkg=$(cacheit extra/$path)
+			fi
+		else
+			l_pkg=$(cacheit $relbase/$path)
+		fi
+	else
+		l_pkg=$(cacheit patches/$path)
 	fi
-	l_pkg=$(cacheit $relbase/$path)
-	if [ -e ./sbin/upgradepkg ] ; then
+	if $installer_fix ; then
+		echo PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+		chroot . /bin/tar-1.13 -xvf ${l_pkg} lib/incoming/libc-2.33.so
+		PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+		chroot . /bin/tar -xvf ${l_pkg} lib/incoming/libc-2.33.so
+		mv lib/incoming/libc-2.33.so lib && rm -rf lib/incoming
+		echo PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+		chroot . /bin/test -x /bin/sh
+		PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+		chroot . /bin/test -x /bin/sh # confirm bug is fixed
+	elif [ -e ./sbin/upgradepkg ] ; then
 		echo PATH=/bin:/sbin:/usr/bin:/usr/sbin \
 		ROOT=/mnt \
 		chroot . /sbin/upgradepkg ${root_flag} ${install_args} ${l_pkg}
@@ -167,16 +248,38 @@ do
 done
 
 cd mnt
-set -x
-touch etc/resolv.conf
-echo "export TERM=linux" >> etc/profile.d/term.sh
-chmod +x etc/profile.d/term.sh
-echo ". /etc/profile" > .bashrc
-echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
-sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
-sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
-sed -i 's/SPINNING=on/SPINNING=off/' etc/slackpkg/slackpkg.conf
+PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+chroot . /bin/sh -c '/sbin/ldconfig'
 
+if [ ! -e ./root/.gnupg ] && [ -e ./usr/bin/gpg ] ; then
+	cacheit "GPG-KEY"
+	cp ${CACHEFS}/GPG-KEY .
+	echo PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+	chroot . /usr/bin/gpg --import GPG-KEY
+	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
+	chroot . /usr/bin/gpg --import GPG-KEY
+	rm GPG-KEY
+fi
+
+set -x
+if [ "$MINIMAL" = "yes" ] || [ "$MINIMAL" = "1" ] ; then
+	echo "export TERM=linux" >> etc/profile.d/term.sh
+	chmod +x etc/profile.d/term.sh
+	echo ". /etc/profile" > .bashrc
+fi
+if [ -e etc/slackpkg ] ; then
+	find etc/slackpkg/ -type f -name "*.new" -exec rename ".new" "" {} \;
+fi
+if [ -e etc/slackpkg/mirrors ] ; then
+	echo "${MIRROR}/${RELEASE}/" >> etc/slackpkg/mirrors
+	sed -i 's/DIALOG=on/DIALOG=off/' etc/slackpkg/slackpkg.conf
+	sed -i 's/POSTINST=on/POSTINST=off/' etc/slackpkg/slackpkg.conf
+	sed -i 's/SPINNING=on/SPINNING=off/' etc/slackpkg/slackpkg.conf
+	if [ "$VERSION" = "current" ] ; then
+		mkdir -p var/lib/slackpkg
+		touch var/lib/slackpkg/current
+	fi
+fi
 if [ ! -f etc/rc.d/rc.local ] ; then
 	mkdir -p etc/rc.d
 	cat >> etc/rc.d/rc.local <<EOF
@@ -188,36 +291,16 @@ EOF
 	chmod +x etc/rc.d/rc.local
 fi
 
-mount --bind /etc/resolv.conf etc/resolv.conf
-
-# for slackware 15.0, slackpkg return codes are now:
-# 0 -> All OK, 1 -> something wrong, 20 -> empty list, 50 -> Slackpkg upgraded, 100 -> no pending updates
-chroot_slackpkg() {
-	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
-	chroot . /bin/bash -c 'yes y | /usr/sbin/slackpkg -batch=on -default_answer=y update'
-	ret=0
-	PATH=/bin:/sbin:/usr/bin:/usr/sbin \
-	chroot . /bin/bash -c '/usr/sbin/slackpkg -batch=on -default_answer=y upgrade-all' || ret=$?
-	if [ $ret -eq 0 ] || [ $ret -eq 20 ] ; then
-		echo "uprade-all is OK"
-		return
-	elif [ $ret -eq 50 ] ; then
-		chroot_slackpkg
-	else
-		return $?
-	fi
-}
-chroot_slackpkg
-
 # now some cleanup of the minimal image
 set +x
 rm -rf var/lib/slackpkg/*
-rm -rf usr/share/locale/*
-rm -rf usr/man/*
-find usr/share/terminfo/ -type f ! -name 'linux' -a ! -name 'xterm' -a ! -name 'screen.linux' -exec rm -f "{}" \;
+if [ "$MINIMAL" = "yes" ] || [ "$MINIMAL" = "1" ] ; then
+	rm -rf usr/share/locale/*
+	rm -rf usr/man/*
+	find usr/share/terminfo/ -type f ! -name 'linux' -a ! -name 'xterm' -a ! -name 'screen.linux' -exec rm -f "{}" \;
+fi
 umount $ROOTFS/dev
 rm -f dev/* # containers should expect the kernel API (`mount -t devtmpfs none /dev`)
-umount etc/resolv.conf
 
 tar --numeric-owner -cf- . > ${CWD}/${RELEASE}.tar
 ls -sh ${CWD}/${RELEASE}.tar
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
