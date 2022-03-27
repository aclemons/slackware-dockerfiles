FROM alpine:3.15 as builder

# Use a simple alpine image to download and verify the pieces we need to create
# the base image for slackware arm.

# hadolint ignore=DL3018
RUN apk add --no-cache wget gpg gpg-agent binutils bash

COPY slackwarearm-14.2/GPG-KEY /tmp/GPG-KEY
RUN gpg --import /tmp/GPG-KEY && rm /tmp/GPG-KEY

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /tmp/miniroot

# download, verify and unpack the slackwaream miniroot
RUN \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt && \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt.asc && \
    gpg --verify slackarm-14.2-miniroot_details.txt.asc slackarm-14.2-miniroot_details.txt && \
    tarball="$(sed -n '/slackarm-14.2-miniroot_/p' slackarm-14.2-miniroot_details.txt | awk '{ print $2 }')" && \
    wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/$tarball" && \
    sed -n '/miniroot_/p' slackarm-14.2-miniroot_details.txt | sed 's/^[[:space:]]*//' | sha1sum -c - && \
    rm slackarm-14.2-miniroot_details.txt* && \
    tar -xf "$tarball" && rm "$tarball"

# fetch some packages requires to run slackpkg
WORKDIR /tmp/pkgs

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    for package in ap/diffutils-3.3-arm-2.txz n/gnupg-1.4.20-arm-1.txz l/libunistring-0.9.3-arm-2.txz ; do \
      wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-14.2/slackware/$package" ; \
      wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-14.2/slackware/$package.asc" ; \
      package=${package##*/} ; \
      gpg --verify "$package.asc" "$package" ; \
      rm "$package.asc" ; \
    done

FROM scratch

COPY --from=builder /tmp/miniroot/. /
COPY --from=builder /tmp/pkgs/*.txz /tmp/

COPY slackwarearm-14.2/GPG-KEY /tmp/

RUN \
    upgradepkg --install-new /tmp/*.txz && \
    gpg --import /tmp/GPG-KEY && \
    rm /tmp/*

RUN \
    sed -i 's/^#\(ftp:\/\/slackware.uk\)/\1/' /etc/slackpkg/mirrors && \
    slackpkg -default_answer=yes -batch=on update && \
    slackpkg -default_answer=yes -batch=on upgrade slackpkg && \
    mv /etc/slackpkg/mirrors.new /etc/slackpkg/mirrors && \
    sed -i 's/^#\(ftp:\/\/slackware.uk\)/\1/' /etc/slackpkg/mirrors && \
    slackpkg -default_answer=yes -batch=on update && \
    slackpkg -default_answer=yes -batch=on upgrade-all && \
    find / -xdev -type f -name "*.new" -exec rename ".new" "" {} + && \
    rm -rf /var/cache/packages/* && rm -rf /var/lib/slackpkg/* && \
    sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf

