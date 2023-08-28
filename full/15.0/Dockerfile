FROM aclemons/slackware:15.0@sha256:d97c99942b939cd8211977559c794ed701881256140ed38c44890d9ea1c9b77c

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
