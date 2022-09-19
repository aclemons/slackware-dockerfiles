FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-12.0.tar /

# pull the setarch binary from slackware 12.1 since it shipped with util-linux-ng and included this.
# we need it for our entrypoint
# hadolint ignore=DL3003
RUN cd /tmp && \
    wget -q http://slackware.uk/slackware/slackware-12.1/slackware/a/util-linux-ng-2.13.1-i486-1.tgz && \
    wget -q http://slackware.uk/slackware/slackware-12.1/slackware/a/util-linux-ng-2.13.1-i486-1.tgz.asc && \
    gpg --verify util-linux-ng-2.13.1-i486-1.tgz.asc util-linux-ng-2.13.1-i486-1.tgz && \
    explodepkg util-linux-ng-2.13.1-i486-1.tgz && \
    mv /tmp/usr/bin/setarch /usr/bin/ && \
    cd /usr/bin && \
    ln -s setarch linux32 && \
    rm -rf /tmp/*

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
