FROM aclemons/slackware:current@sha256:e43386fd9c209aa33f0a5f74c21779e67109d5363c488058aad54e65dc3d9e06

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
