FROM aclemons/slackware:current@sha256:cc62abe716b0201f9aa51ccd175412e0fec068fe8e5110c8b100f5c0c98c7559

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
