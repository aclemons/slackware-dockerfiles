FROM aclemons/slackware:current@sha256:7651868ff53540976425191ad03c198db3ce9812832e84d07da6cca5bc5ccf02

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
