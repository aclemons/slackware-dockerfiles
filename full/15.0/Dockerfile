FROM aclemons/slackware:15.0@sha256:feb61a67d678e2d4a7d3e78202fd0ee94f7c1613a7399850aace7c47406d5b15

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
