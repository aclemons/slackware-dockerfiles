FROM aclemons/slackware:15.0@sha256:b9e7dffe90441fd6e5440d9cbeef4ef1e9692f5f8b909758cc7c7e6c5d1d5666

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
