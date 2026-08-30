FROM aclemons/slackware:current@sha256:73be133f9bafa79614eb079e57a04afd473246db23d7d8c1a24f52907f9a4424

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
