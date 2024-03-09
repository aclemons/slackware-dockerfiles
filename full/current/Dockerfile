FROM aclemons/slackware:current@sha256:3d71b58a0eb73a0aa7ad45218c0553b6311deef80beb8fbeead8f40c1ece395c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
