FROM aclemons/slackware:current@sha256:b43169316a0e30441ade2d26e2239dff32b4a895b8b482dc968a0b9f939b3e0f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
