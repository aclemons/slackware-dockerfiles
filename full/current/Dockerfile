FROM aclemons/slackware:current@sha256:b2260710631baccc004235d640119e80fab46c70df733584d40fd9877b0c9e91

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
