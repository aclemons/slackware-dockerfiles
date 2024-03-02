FROM aclemons/slackware:current@sha256:d8c72141159caeef6259f96e78c215c651d8479a4d8012ab08fe1164d8071d92

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
