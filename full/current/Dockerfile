FROM aclemons/slackware:current@sha256:e61b7b78b50af8dcd6a558caa09b8b5c900674da27724708c26854ba294b02a2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
