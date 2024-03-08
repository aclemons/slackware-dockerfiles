FROM aclemons/slackware:current@sha256:8b36ab06a912874fffe1645e4a5cdc88ec4ec9a13ea82104c782a733c89e95d9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
