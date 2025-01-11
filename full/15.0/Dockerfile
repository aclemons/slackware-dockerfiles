FROM aclemons/slackware:15.0@sha256:204ec5b91e80537064ff22f3df4d6c0ce7d78ea3540ff494b1b2b7bb19890f42

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
