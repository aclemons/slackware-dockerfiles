FROM aclemons/slackware:15.0@sha256:6e514be2e694fca9ffc749396b872d55cbf890e5ec57dfddcab0cc47d45f30d6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
