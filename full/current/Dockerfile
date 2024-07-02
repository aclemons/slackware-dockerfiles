FROM aclemons/slackware:current@sha256:4e69178298bb6f2ddfda75a2dbc4df8b5f78db3145b51c3d9547caea88837f64

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
