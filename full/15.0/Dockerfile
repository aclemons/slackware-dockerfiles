FROM aclemons/slackware:15.0@sha256:004bef3ed7c7346f83fdf0a0b66dca9f4e45e3194dfd7ae28516ac7ebcf34045

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
