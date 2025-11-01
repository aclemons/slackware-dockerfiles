FROM aclemons/slackware:15.0@sha256:efed596db3b51e8b3e89e7642cd6ac8d275ef083f578bcee8d4f206b49048845

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
