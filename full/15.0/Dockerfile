FROM aclemons/slackware:15.0@sha256:c91e6f3d9ba4582e15a6fbb040cb63919748c8b90963d42fe4f489bc4b3d12c2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
