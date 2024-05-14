FROM aclemons/slackware:15.0@sha256:baf301bf00716f816f6eddaa7c784506ce4e167a6e3924ccdb7aa446e9af041e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
