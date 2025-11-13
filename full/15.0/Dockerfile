FROM aclemons/slackware:15.0@sha256:28eab9dcecaa61a791e86d0ed11eb33f7f21cb45ff37f341e3cfd1ea7402e34a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
