FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-12.1.tar /

COPY slackware-12.1/GPG-KEY /tmp
RUN gpg --import /tmp/GPG-KEY && rm /tmp/GPG-KEY

# hadolint ignore=DL3003
RUN \
    mkdir -p /tmp/patches && \
    cd /tmp/patches && \
    wget -q http://slackware.uk/slackware/slackware-12.1/slackware/n/rsync-3.0.2-i486-1.tgz && \
    wget -q http://slackware.uk/slackware/slackware-12.1/slackware/n/rsync-3.0.2-i486-1.tgz.asc && \
    wget -q http://slackware.uk/slackware/slackware-12.1/extra/slackpkg/slackpkg-2.70.3-noarch-2.tgz && \
    wget -q http://slackware.uk/slackware/slackware-12.1/extra/slackpkg/slackpkg-2.70.3-noarch-2.tgz.asc && \
    gpg --verify rsync-3.0.2-i486-1.tgz.asc rsync-3.0.2-i486-1.tgz && \
    gpg --verify slackpkg-2.70.3-noarch-2.tgz.asc slackpkg-2.70.3-noarch-2.tgz && \
    installpkg rsync-3.0.2-i486-1.tgz slackpkg-2.70.3-noarch-2.tgz && rm -rf /tmp/patches

# As above, this will invalidate the cached layer when the ChangeLog is updated
# and we will only rebuild from below.
COPY slackware-12.1/ChangeLog.txt.386 /tmp

# hadolint ignore=DL3003
RUN \
    rm /tmp/ChangeLog* && \
    rsync --delete -rlptD --delete-excluded --bwlimit 0 slackware.uk::slackware/slackware-12.1/patches/packages/ /tmp/patches && \
    ( cd /tmp/patches && \
    for package in /tmp/patches/*.t?z ; do \
      package=${package##*/} ; \
      gpg --verify "$package.asc" "$package" ; \
    done && \
    upgradepkg /tmp/patches/*.t?z || true ) && \
    rm -rf /tmp/patches/ && \
    find / -xdev -type f -name "*.new" -exec rename ".new" "" {} + && \
    rm -rf /var/cache/packages/* && rm -rf /var/lib/slackpkg/* && \
    echo "http://slackware.osuosl.org/slackware-12.1/" >> /etc/slackpkg/mirrors && \
    sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf && \
    sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
