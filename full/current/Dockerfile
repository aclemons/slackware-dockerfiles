FROM aclemons/slackware:current@sha256:77531b25f7535d4acb9f6e85bc24aac8e8e7c96e04e372c7150358bd40751d41

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
