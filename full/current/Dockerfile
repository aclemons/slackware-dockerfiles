FROM aclemons/slackware:current@sha256:8f0710d4d6169c648a45d2a5e66d1abd6c359b07beb65d15df708d2cd81a3e44

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
