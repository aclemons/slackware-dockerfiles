FROM aclemons/slackware:current@sha256:b939867acd244569c3af72634998f24e3378e6a97d7fdbf9a6c8eae2f111e2a8

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
