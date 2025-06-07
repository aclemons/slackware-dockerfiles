FROM aclemons/slackware:current@sha256:da3171abf0ce80bbd37430bf745ed51ca48e4890a3a83f7cf71d6a769a91e5e2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
