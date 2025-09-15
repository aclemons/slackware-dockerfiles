FROM aclemons/slackware:current@sha256:d68ba44a3f0c7b1203fd2ace3023dc479b583d20f9428f3f2a47cea4b2604689

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
