FROM aclemons/slackware:15.0@sha256:2d3a9c0c3bc78a6693f14a18bba0a383b36449cb0dc9c46b456eaa165d245566

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
