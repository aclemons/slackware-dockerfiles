FROM aclemons/slackware:current@sha256:4a65cfcee300090dcef35c1d755b8fa3db22ed70ea590906e8e8ad6137c726c6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
