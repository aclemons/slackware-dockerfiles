FROM aclemons/slackware:current@sha256:ca5f63defb296268b6575fb0740b1534087687cded1c145f65cf12652b72bbdb

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
