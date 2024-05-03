FROM aclemons/slackware:current@sha256:91ad940aa3b8145e29f010f662fedfe80dd690372b3eca8ac4e480a0a8be4464

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
