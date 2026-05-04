FROM aclemons/slackware:15.0@sha256:c72b5f3228ccb55701eacc7e45e65b1c58ce2dc11a7c265c326d6d00ec8f341b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
