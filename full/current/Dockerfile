FROM aclemons/slackware:current@sha256:8ea7d872681b1d22b134776eaf07fce7d5ad5226f873e958b551613874de83a0

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
