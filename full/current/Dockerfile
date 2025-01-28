FROM aclemons/slackware:current@sha256:e70c682a302a4f68ff64a45e0c02df28c932d9273badab99e16fd16edaed4e95

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
