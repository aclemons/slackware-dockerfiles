FROM aclemons/slackware:current@sha256:de48402870ac220a3b7ea6b338ee81c8b29904c4539ccb0b78b83205911cfb65

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
