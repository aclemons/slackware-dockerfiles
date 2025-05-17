FROM aclemons/slackware:current@sha256:a074e724b1fce38e8b27dc5a796cea541a65a27efa84b09b5a94469bace7267e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
