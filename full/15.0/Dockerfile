FROM aclemons/slackware:15.0@sha256:8c36704f99d1a9babcbd240ec4f29e3267d7fc41c6ffa617ccf8204c2cd93f92

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
