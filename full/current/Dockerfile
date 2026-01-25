FROM aclemons/slackware:current@sha256:d8b94c633302d63dcb6ceacc3ca299f3d213b29c20b4e7c626e23769719a3a2a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
