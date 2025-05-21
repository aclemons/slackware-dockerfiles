FROM aclemons/slackware:15.0@sha256:d167f001c0e2571e5aa35d59b5b32e9381b4656c7b27e877da659f4d4fabfb69

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
