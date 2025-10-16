FROM aclemons/slackware:15.0@sha256:364b9e630214bce235f6c2f858df7426a2b4ab0e8aa8ed2d7fb3ceeb457d7339

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
