FROM aclemons/slackware:current@sha256:e38982937900e99ef087badbd407dbb884bbc0326bcffb10c423a56a2dd60bc4

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
