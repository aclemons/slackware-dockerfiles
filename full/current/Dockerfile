FROM aclemons/slackware:current@sha256:cd293ba5aeb22b4f8b28aa0568d594ac78c0b159479286ef8496b6fcfd73747d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
