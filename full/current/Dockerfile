FROM aclemons/slackware:current@sha256:eb921b23f6c830b9d3d8797a526d2686be057f0c3bbefc6f079b9c18e838ce3e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
