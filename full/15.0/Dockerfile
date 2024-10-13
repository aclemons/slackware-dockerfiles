FROM aclemons/slackware:15.0@sha256:31dee023a5b72f8630780e5f407e866717e00a0663fd10649d157201ee77d6f2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
