FROM aclemons/slackware:current@sha256:58d3bf4b636bc4ebcd46935ddc10fd024c133e922227b1fe10a0b9b61efb81f9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
