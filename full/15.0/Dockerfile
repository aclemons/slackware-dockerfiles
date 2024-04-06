FROM aclemons/slackware:15.0@sha256:de72e14ffd10405ba25c4f4e2d4bb5a9d76f0154512900a6aa16e88f57b07961

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
