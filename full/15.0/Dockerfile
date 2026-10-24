FROM aclemons/slackware:15.0@sha256:40f9b0b511e46933ff1ed5a32270c8099d6a84b98c41832a9aed480239fc5213

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
