FROM aclemons/slackware:15.0@sha256:163d1aa1658b307113da46be5a6646f7e06989542f11eaf8693ed61839bb1f71

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
