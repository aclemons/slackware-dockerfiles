FROM aclemons/slackware:current@sha256:2f14fd0ffba2bdc6dc2352009673d00b7cecf3af08541dd7a6169a698dc42263

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
