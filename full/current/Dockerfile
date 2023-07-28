FROM aclemons/slackware:current@sha256:4e4f58a98c5c9794849fdec5fd595ad00eeff9d9065ffe2a2d81f25f2706f080

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
