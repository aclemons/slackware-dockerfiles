FROM aclemons/slackware:15.0@sha256:c4fff5e20f3fce49bb1a51f62c57cc2314e68d4aa0e15ad6067659c71c552ede

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
