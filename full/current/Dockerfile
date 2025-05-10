FROM aclemons/slackware:current@sha256:465f301bbf8e6a4c166819b1135bda9c3b428084ee465f8f5c0eecdd6d96e414

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
