FROM aclemons/slackware:current@sha256:24818a5f4d9116835f9fb06a1d695dc2499e44c751281a10288fa6dc58f4fdb7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
