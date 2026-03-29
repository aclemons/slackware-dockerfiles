FROM aclemons/slackware:current@sha256:b95ce2b7ae06352acef54cdecb9ecd1ef358f8e418576eb19dde29e0fbe8287d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
