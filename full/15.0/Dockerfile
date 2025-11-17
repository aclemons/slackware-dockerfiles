FROM aclemons/slackware:15.0@sha256:436229e11a70b02923c49ad28296f5847d0183d41c91f829fc41bbdd95f9edb8

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
