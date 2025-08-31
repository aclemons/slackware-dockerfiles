FROM aclemons/slackware:current@sha256:3d7cb493470a3e7993b0ded66a5aaf1f6e35ede4c8d0fc6c90ea7022aed65709

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
