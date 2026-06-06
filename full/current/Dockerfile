FROM aclemons/slackware:current@sha256:d4a3fdbf5aec240bd472969013d6d2001cb7644c190d2c4ffaf14bce07e39ddb

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
