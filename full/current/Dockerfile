FROM aclemons/slackware:current@sha256:4d949b80d0b383f30b775afa30c41ad0ab2b10b76cefd6f5adce7d729120d3b7

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
