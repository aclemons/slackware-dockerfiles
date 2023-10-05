FROM aclemons/slackware:current@sha256:ccb69d1dc63142dddf7b0943a0b4cce56f2dcc1ad02954af81cdc903e186063f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
