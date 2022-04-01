FROM alpine:3.15 as builder

# Use a simple alpine image to download and verify the pieces we need to create
# the base image for slackware arm.

# hadolint ignore=DL3018
RUN apk add --no-cache wget gpg gpg-agent binutils bash

COPY slackwareaarch64-current/GPG-KEY* /tmp/
RUN gpg --import /tmp/GPG-KEY* && rm /tmp/GPG-KEY*

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /tmp/miniroot

# download, verify and unpack the slackwaream miniroot
RUN \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackaarch64-current-miniroot_details.txt && \
    wget --quiet https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackaarch64-current-miniroot_details.txt.asc && \
    gpg --verify slackaarch64-current-miniroot_details.txt.asc slackaarch64-current-miniroot_details.txt && \
    tarball="$(sed -n '/slackaarch64-current-miniroot_/p' slackaarch64-current-miniroot_details.txt | awk '{ print $2 }')" && \
    wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/$tarball" && \
    sed -n '/miniroot_/p' slackaarch64-current-miniroot_details.txt | sed 's/^[[:space:]]*//' | sha1sum -c - && \
    rm slackaarch64-current-miniroot_details.txt* && \
    tar -xf "$tarball" && rm "$tarball"

WORKDIR /tmp/qemu

# fetch some packages requires to run slackpkg
WORKDIR /tmp/pkgs

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    wget --quiet https://slackware.uk/slackwarearm/slackwareaarch64-current/slackware/ap/diffutils-3.8-aarch64-1.txz && \
    wget --quiet https://slackware.uk/slackwarearm/slackwareaarch64-current/slackware/ap/diffutils-3.8-aarch64-1.txz.asc && \
    gpg --verify diffutils-3.8-aarch64-1.txz.asc diffutils-3.8-aarch64-1.txz && \
    rm diffutils-3.8-aarch64-1.txz.asc

FROM scratch

COPY --from=builder /tmp/miniroot/. /
COPY --from=builder /tmp/pkgs/*.txz /tmp/

COPY slackwareaarch64-current/GPG-KEY* /tmp/

RUN \
    upgradepkg --install-new /tmp/*.txz && \
    gpg --import /tmp/GPG-KEY* && \
    rm /tmp/* && \
    sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf
