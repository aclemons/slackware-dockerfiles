FROM aclemons/slackware:current@sha256:19efbd4dcc18b98a878d9973022c0bc2c5fa39f545e2966956193d25ce361e2d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
