FROM aclemons/slackware:current@sha256:da013f2d89d02c3e21c5845b05cd0b8bc124ab6a8334c99c040741d794097899

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
