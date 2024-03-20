FROM aclemons/slackware:15.0@sha256:1cd1d7245059706bd4e21e3694a33830179a9601d373e11065f055ca40789bd7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
