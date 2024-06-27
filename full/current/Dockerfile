FROM aclemons/slackware:current@sha256:f823e1cc97f10606add570e6169feff97a4b8b54e941966ee18387f6c713d3be

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
