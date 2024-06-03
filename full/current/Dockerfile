FROM aclemons/slackware:current@sha256:5cc2a0f2e256a081c0ede360a159d9c19b88eaf6dd7d2135c6afa4fe20a4be14

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
