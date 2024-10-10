FROM aclemons/slackware:current@sha256:9579db887d2d1effbda944ad7b7a95adb84978c87f19bdd66c7d2a19875b6811

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
