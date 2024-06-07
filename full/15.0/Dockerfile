FROM aclemons/slackware:15.0@sha256:a23b822a17d332e888c84123080689211c995313fe8e28e6947548140ab5215a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
