FROM aclemons/slackware:15.0@sha256:ad5ae7cd1cb94f2a1783323afe22119e727ca963e164d290051cc99ffec06a0e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
