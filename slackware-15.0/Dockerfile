FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-15.0.tar /

FROM scratch as slackware-amd64
ADD slackware64-15.0.tar /

FROM scratch as slackware-arm
ADD slackwarearm-15.0.tar /

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
