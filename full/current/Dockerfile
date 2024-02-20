FROM aclemons/slackware:current@sha256:03d70004bef074980355a8114867185bb5f198ce35f20a97a5ebdd43ee8942de

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
