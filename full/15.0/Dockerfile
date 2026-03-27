FROM aclemons/slackware:15.0@sha256:dcb72fc6a6531871891dcd93d79712964db677bb7e0c6f4c7f956f3d91964550

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
