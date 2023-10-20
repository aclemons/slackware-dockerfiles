FROM aclemons/slackware:current@sha256:9bc3293c31a63b300bb21dfe38445e742f76e9276544fa3d634a1eafd023090b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
