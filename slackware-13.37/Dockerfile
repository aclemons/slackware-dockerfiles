FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-13.37.tar /

FROM scratch as slackware-amd64
ADD slackware64-13.37.tar /

FROM scratch as slackware-arm
ADD armedslack-13.37.tar /

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
