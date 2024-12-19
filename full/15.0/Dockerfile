FROM aclemons/slackware:15.0@sha256:2e4153aaed5a668d925956db5cdd70cb4e64e593e9cd8c6e3ce4501ff5e539db

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
