FROM aclemons/slackware:current@sha256:1ee7af239d68ca59cf2033de77e3a40f07ad9b3b1c8539d64c7598829033a2de

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
