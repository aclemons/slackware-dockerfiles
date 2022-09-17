FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-current.tar /

FROM scratch as slackware-amd64
ADD slackware64-current.tar /

FROM scratch as slackware-arm64
ADD slackwareaarch64-current.tar /

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
