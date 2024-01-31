FROM aclemons/slackware:15.0@sha256:ba929a719295eaae77d1eeed66afd796c3c07c8925128cbf75b59280c1d724a7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
