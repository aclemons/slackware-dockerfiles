FROM scratch as slackware-386
ENTRYPOINT ["linux32"]
ADD slackware-12.2.tar /

FROM scratch as slackware-arm
ADD armedslack-12.2.tar /

ARG TARGETARCH=
# hadolint ignore=DL3006
FROM slackware-$TARGETARCH
CMD ["bash"]
