FROM aclemons/slackware:15.0@sha256:f232fba404cfffc0bf02206b3c6ea6c82c35780b3757e10957b691f1ed2fd724

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
