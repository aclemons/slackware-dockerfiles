FROM aclemons/slackware:current@sha256:07a0efcd38ee41d11e4198377e0327037d639947187b3e595cd56517e2655600

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
