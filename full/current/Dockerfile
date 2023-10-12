FROM aclemons/slackware:current@sha256:d735221ea578878169c01396b927c2d89e723b95b4699b08263df1a95962d1c5

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
