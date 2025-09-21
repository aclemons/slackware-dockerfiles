FROM aclemons/slackware:current@sha256:b1706924ccac4fe366eb3edf1ab1cfce613f6b476f03db0e60ecfb1204a808a2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
