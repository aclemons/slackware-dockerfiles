FROM aclemons/slackware:current@sha256:6282a6c44f536b0afc3d8d599d5cbc9d82da35a71cb150e7ff0436190cd7c983

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
