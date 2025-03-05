FROM aclemons/slackware:current@sha256:3d168706007e6ab59556f11b64ef88016d626eb1ae68fc4f9c0ecd090556a5d7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
