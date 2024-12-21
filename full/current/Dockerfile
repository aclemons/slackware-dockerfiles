FROM aclemons/slackware:current@sha256:5be288902591190ea535a10db69ae041f2bda09f4a482f067eed14c37b1103ea

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
