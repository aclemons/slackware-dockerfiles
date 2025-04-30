FROM aclemons/slackware:current@sha256:42571cfe77cfef0c392dcc6e09019e0f9099776158472aaf2cf634bb2929071a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
