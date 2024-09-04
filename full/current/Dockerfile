FROM aclemons/slackware:current@sha256:fc7a3fc3135fc52240680947911c838c646caacdeff82672ff65e76b4152df91

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
