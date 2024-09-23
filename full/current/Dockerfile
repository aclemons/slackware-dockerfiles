FROM aclemons/slackware:current@sha256:14536d59cfa3c53a4f37ec72dca3a8fc99320d96148c2385839531fe03c89281

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
