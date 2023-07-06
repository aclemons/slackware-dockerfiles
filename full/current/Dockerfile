FROM aclemons/slackware:current@sha256:68470eb422c3620582d502c206b100c891ed05d66f8616fcbabcd0d694fbf34e

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
