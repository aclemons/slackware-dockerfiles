FROM aclemons/slackware:15.0@sha256:e0741e5c49d9bd18bb9dc454df83db87220f2d20ec312a13a46ad2f9a6bf5eaf

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
