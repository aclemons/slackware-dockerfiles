FROM aclemons/slackware:current@sha256:48ec56be655f556abf75b815d8e3f98b4b8646968fc04bc3def13fb6416668ab

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
