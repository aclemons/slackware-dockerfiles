FROM aclemons/slackware:15.0@sha256:582bce6e777e9c07453d3c05a47b8b33acdc560f8ec64d29b40a4ccc93d6ec91

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
