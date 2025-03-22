FROM aclemons/slackware:current@sha256:2f8fc5be28600d6432b821cf2af474e06349fe58d090c234e7e88a7c72f86afb

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
