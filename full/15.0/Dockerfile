FROM aclemons/slackware:15.0@sha256:f8a27f83310fab4fd5824751a653a344f34d9027e582359471b2ea9e78a35efc

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
