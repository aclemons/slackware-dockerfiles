FROM aclemons/slackware:current@sha256:78b26a0c8de46db37529ae01334f9e261036e7baca118b96170522ffad81f1b7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
