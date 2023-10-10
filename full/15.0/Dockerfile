FROM aclemons/slackware:15.0@sha256:ef17613275319e01cb0a0c5ba09a20681c90a3e73f5ef2fff6a10eef282a2b54

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
