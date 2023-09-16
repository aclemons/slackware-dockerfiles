FROM aclemons/slackware:15.0@sha256:e45acd4ad7feaa0e8ff4da012f475b1f561bc505a003e71d86aae5bb09d4913f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
