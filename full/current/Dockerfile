FROM aclemons/slackware:current@sha256:0250595de849da074c90d3f10926ac6042eb60c492586c04484b623da2310eb0

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
