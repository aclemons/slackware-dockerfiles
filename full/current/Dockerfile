FROM aclemons/slackware:current@sha256:0c676772dfdbc52f66ce74479b0d891473c37798bb7d60e8566895085424bac1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
