FROM aclemons/slackware:current@sha256:38b110a8b49b980791a548465debf7dc4dec434fc4471c833b9b8a3c14af7a32

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
