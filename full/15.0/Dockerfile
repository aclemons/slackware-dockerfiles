FROM aclemons/slackware:15.0@sha256:2316fb693a190d5a6fc76fa10670b0e1120e52815fb131bb3941ed6d750a7d40

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
