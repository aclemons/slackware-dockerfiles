FROM aclemons/slackware:current@sha256:b66a64698e83f31b40e1d9f5ed2dbd5247f0ca1efcfad48a768efb43cad568e3

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
