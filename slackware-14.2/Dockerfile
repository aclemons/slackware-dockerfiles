FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-14.2.tar /

FROM scratch as slackware-amd64
ADD slackware64-14.2.tar /

FROM scratch as slackware-arm
ADD slackwarearm-14.2.tar /

COPY slackware-14.2/GPG-KEY /tmp/

RUN gpg --import /tmp/GPG-KEY && rm /tmp/*

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
