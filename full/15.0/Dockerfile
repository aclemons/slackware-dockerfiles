FROM aclemons/slackware:15.0@sha256:5bc4227d0e082def1e022aac641c45864f9ede99c2fba77c9a10750c1439931a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
