FROM aclemons/slackware:15.0@sha256:e8f1a4de6918fe655b30500bf78a7eecff1df0ab5a647b20b97c47d289e19112

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
