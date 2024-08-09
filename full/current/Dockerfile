FROM aclemons/slackware:current@sha256:c4dbf79924c041a6e8e7aad115b19d9340b722b2639fa152f2db11f413987cae

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
