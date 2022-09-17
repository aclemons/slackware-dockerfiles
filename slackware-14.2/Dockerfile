FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-14.2.tar /

FROM scratch as slackware-amd64
ADD slackware64-14.2.tar /

FROM scratch as slackware-arm
ADD slackwarearm-14.2.tar /

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
