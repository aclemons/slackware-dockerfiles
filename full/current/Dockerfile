FROM aclemons/slackware:current@sha256:b40cbcbcd8e44a5b6194b00c2b4706cda2770b3759f603f8156762c5fa41417f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
