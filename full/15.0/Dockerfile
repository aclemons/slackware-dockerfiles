FROM aclemons/slackware:15.0@sha256:7e1c96553a16c39962cee65b2e841e3d79ead09c3b1c655f202bb4a17d02b744

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
