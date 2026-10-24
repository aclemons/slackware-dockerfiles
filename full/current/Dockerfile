FROM aclemons/slackware:current@sha256:9b0336631378cb4429d736ff394e04b7ee4d79dfdf7a046aaabd297e09f4e99d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
