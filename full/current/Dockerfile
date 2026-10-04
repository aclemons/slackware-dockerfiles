FROM aclemons/slackware:current@sha256:137bf08bcfd70a2706c5637407ba669f8ce5d016b8207de516b3a68510a52485

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
