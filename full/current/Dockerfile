FROM aclemons/slackware:current@sha256:d6545bf8529068603627e20b6240fbe3ca7acd05b048ede06d0d32667d7270f3

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
