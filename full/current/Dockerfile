FROM aclemons/slackware:current@sha256:3eb2a1db7e059dbe8ad9a1e6ebf44de66a7fe43e73b03fc3061dbf82343d1dd9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
