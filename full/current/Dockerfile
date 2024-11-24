FROM aclemons/slackware:current@sha256:6e94e3fe3f6378bd5426c097578b23faa365e31465bf86de9e54e581fc66ea33

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
