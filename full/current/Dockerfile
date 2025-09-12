FROM aclemons/slackware:current@sha256:8b204ca791b74ef65fed75eab5705e9400acb3f0aa30910fcc563f2b4253e580

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
