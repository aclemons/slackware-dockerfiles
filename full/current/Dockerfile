FROM aclemons/slackware:current@sha256:cd9ff0d678379910d00447ea7a990080067df37c04a2d3d5fcf563cc310eda22

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
