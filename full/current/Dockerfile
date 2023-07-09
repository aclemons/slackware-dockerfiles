FROM aclemons/slackware:current@sha256:0ca1c8f2bb52db815fb72b83439dcb3b11098ae58f2c63b7c460ba1c8f520021

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
