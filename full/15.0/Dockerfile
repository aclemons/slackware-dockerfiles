FROM aclemons/slackware:15.0@sha256:60f431e1c33f3663532239ed6b063478d52791e20d8e2692600f152a34eefbaf

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
