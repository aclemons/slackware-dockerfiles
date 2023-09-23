FROM aclemons/slackware:15.0@sha256:ee1ae2acf95a47a553402a03df0dc01799ea80e89ac0d76777401b1f84db9d63

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
