FROM aclemons/slackware:15.0@sha256:f3744d806955e2616e9239a5e7c6ae39bbffddb8bc3a9cd3e5f37a5ac8ac1775

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
