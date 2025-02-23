FROM aclemons/slackware:15.0@sha256:c9c2a6b8cb383d4d6edd382f336b3cada840eabb877899642bdeb28ee0d874e9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
