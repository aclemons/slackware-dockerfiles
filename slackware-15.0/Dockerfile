FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-15.0.tar /

FROM scratch as slackware-amd64
ADD slackware64-15.0.tar /

FROM alpine:3.15 as arm-builder

# Use a simple alpine image to download and verify the pieces we need to create
# the base image for slackware arm.

# hadolint ignore=DL3018
RUN apk add --no-cache wget gpg gpg-agent binutils bash

COPY slackware-15.0/GPG-KEY /tmp/GPG-KEY
RUN gpg --import /tmp/GPG-KEY && rm /tmp/GPG-KEY

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /tmp/miniroot

# We download this outside of the docker build and copy it into the image so we
# can set this build on a timer and have the cache invalidated when the miniroot
# changes.

# download, verify and unpack the slackwaream miniroot
COPY slackware-15.0/slackarm-15.0-miniroot_details.txt* ./
RUN \
    gpg --verify slackarm-15.0-miniroot_details.txt.asc slackarm-15.0-miniroot_details.txt && \
    tarball="$(sed -n '/slackarm-15.0-miniroot_/p' slackarm-15.0-miniroot_details.txt | awk '{ print $2 }')" && \
    wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/$tarball" && \
    sed -n '/miniroot_/p' slackarm-15.0-miniroot_details.txt | sed 's/^[[:space:]]*//' | sha1sum -c - && \
    rm slackarm-15.0-miniroot_details.txt* && \
    tar -xf "$tarball" && rm "$tarball"

# fetch some packages required to run slackpkg
WORKDIR /tmp/pkgs

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-15.0/slackware/ap/diffutils-3.8-arm-1.txz && \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-15.0/slackware/ap/diffutils-3.8-arm-1.txz.asc && \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-15.0/slackware/l/libseccomp-2.5.3-arm-1.txz && \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-15.0/slackware/l/libseccomp-2.5.3-arm-1.txz.asc && \
    gpg --verify diffutils-3.8-arm-1.txz.asc diffutils-3.8-arm-1.txz && \
    gpg --verify libseccomp-2.5.3-arm-1.txz.asc libseccomp-2.5.3-arm-1.txz && \
    rm diffutils-3.8-arm-1.txz.asc libseccomp-2.5.3-arm-1.txz.asc

FROM scratch as slackware-arm

COPY --from=arm-builder /tmp/miniroot/. /
COPY --from=arm-builder /tmp/pkgs/*.txz /tmp/

COPY slackware-15.0/GPG-KEY /tmp/

RUN \
    upgradepkg --install-new /tmp/*.txz && \
    gpg --import /tmp/GPG-KEY && \
    rm /tmp/*

# As above, this will invalidate the cached layer when the ChangeLog is updated
# and we will only rebuild from below.
COPY slackware-15.0/ChangeLog.txt.arm /tmp

RUN \
    rm /tmp/ChangeLog* && \
    sed -i '/slackwarearm-15.0/s/^#\(http:\/\/slackware.uk\)/\1/' /etc/slackpkg/mirrors && \
    sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf

ARG TARGETARCH=
FROM slackware-$TARGETARCH
