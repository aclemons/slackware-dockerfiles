FROM scratch AS slackware-386
ARG VERSION
ADD slackware-$VERSION.tar /

FROM scratch AS slackware-amd64
ARG VERSION
ADD slackware64-$VERSION.tar /

FROM scratch AS slackware-arm
ARG VERSION
ADD slackwarearm-$VERSION.tar /

FROM scratch AS slackware-arm64
ARG VERSION
ADD slackwareaarch64-$VERSION.tar /

ARG TARGETARCH
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
