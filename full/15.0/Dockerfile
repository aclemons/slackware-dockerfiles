FROM aclemons/slackware:15.0@sha256:2544ab978efbe420751151741d28b39d972832ba80c2e200781a8a6dfe574ebb

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
