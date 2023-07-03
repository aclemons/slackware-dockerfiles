FROM aclemons/slackware:current@sha256:78a4abb72578cbbeeff7160df46b5b4a6295a7680556ecb30bba71616889eed6

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
