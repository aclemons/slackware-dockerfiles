FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-12.2.tar /

FROM scratch as slackware-amd64
ADD slackware64-12.2.tar /

# hadolint ignore=DL3029
FROM --platform=linux/arm/v6 alpine:3.15 as arm-builder

# Use a simple alpine image to download and verify the pieces we need to create
# the base image for slackware arm.

# hadolint ignore=DL3018
RUN apk add --no-cache wget gpg gpg-agent binutils bash

COPY slackware-12.2/GPG-KEY /tmp/GPG-KEY
RUN gpg --import /tmp/GPG-KEY && rm /tmp/GPG-KEY

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

WORKDIR /tmp/miniroot

# We download this outside of the docker build and copy it into the image so we
# can set this build on a timer and have the cache invalidated when the miniroot
# changes.

# download, verify and unpack the slackwaream miniroot
COPY slackware-12.2/slackarm-12.2-miniroot_details.txt* ./
RUN \
    gpg --verify slackarm-12.2-miniroot_details.txt.asc slackarm-12.2-miniroot_details.txt && \
    tarball="$(sed -n '/slackarm-12.2-miniroot_/p' slackarm-12.2-miniroot_details.txt | awk '{ print $2 }')" && \
    wget --quiet "https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/$tarball" && \
    sed -n '/miniroot_/p' slackarm-12.2-miniroot_details.txt | sed 's/^[[:space:]]*//' | sha1sum -c - && \
    rm slackarm-12.2-miniroot_details.txt* && \
    tar -xf "$tarball" && rm "$tarball"

# fetch some packages required to run slackpkg
WORKDIR /tmp/pkgs

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    for package in slackware/ap/diffutils-3.0-arm-1.tgz slackware/n/gnupg-1.4.10-arm-1.tgz slackware/ap/slackpkg-2.81.1-arm-2.tgz ; do \
      wget --quiet "https://slackware.uk/slackwarearm/armedslack-12.2/$package" ; \
      wget --quiet "https://slackware.uk/slackwarearm/armedslack-12.2/$package.asc" ; \
      package=${package##*/} ; \
      gpg --verify "$package.asc" "$package" ; \
      rm "$package.asc" ; \
    done

FROM scratch as slackware-arm

COPY --from=arm-builder /tmp/miniroot/. /
COPY --from=arm-builder /tmp/pkgs/*.t?z /tmp/

COPY slackware-12.2/GPG-KEY /tmp/

RUN \
    upgradepkg --install-new /tmp/*.t?z && \
    gpg --import /tmp/GPG-KEY && \
    rm /tmp/*

# As above, this will invalidate the cached layer when the ChangeLog is updated
# and we will only rebuild from below.
COPY slackware-12.2/ChangeLog.txt.arm /tmp

# hadolint ignore=DL3003
RUN \
    rm /tmp/ChangeLog* && \
    sed -i '/armedslack-12.2/s/^\(#ftp:\/\/ftp.armedslack.org.*\)/\1\nhttp:\/\/slackware.uk\/slackwarearm\/armedslack-12.2\//' /etc/slackpkg/mirrors && \
    rsync --delete -rlptD --delete-excluded --bwlimit 0 slackware.uk::slackwarearm/armedslack-12.2/patches/packages/ /tmp/patches && \
    ( cd /tmp/patches && \
    for package in /tmp/patches/*.t?z ; do \
      package=${package##*/} ; \
      gpg --verify "$package.asc" "$package" ; \
    done && \
    upgradepkg /tmp/patches/*.t?z || true ) && \
    rm -rf /tmp/patches/ && \
    find / -xdev -type f -name "*.new" -exec rename ".new" "" {} + && \
    rm -rf /var/cache/packages/* && rm -rf /var/lib/slackpkg/* && \
    sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
