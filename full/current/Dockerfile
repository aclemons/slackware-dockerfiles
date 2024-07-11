FROM aclemons/slackware:current@sha256:a7cb31cc0c821bee078ca99b2b1eda048b158a84b5c2d925d77d6572eca2eda6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
