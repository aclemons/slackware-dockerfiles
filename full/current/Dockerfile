FROM aclemons/slackware:current@sha256:91aace57353ff80293481f1ae08a4ee02d5d6295b23c72f88eab7f76519c76f4

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
