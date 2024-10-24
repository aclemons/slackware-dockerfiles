FROM aclemons/slackware:current@sha256:727cdf290eb9f26c958a22c8495b450880cf8249049d58692c39997c66d3f23f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
