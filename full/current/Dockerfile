FROM aclemons/slackware:current@sha256:c19342e64c73b002e1654516f43ae23cbf6bd0958bd382356494a686401f22cf

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
