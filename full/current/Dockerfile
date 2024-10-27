FROM aclemons/slackware:current@sha256:08286b3bc845161ccfb51400934befbfe6ca119fc32ca9c5152b866a1f9ee8d3

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
