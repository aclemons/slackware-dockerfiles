FROM aclemons/slackware:15.0@sha256:05a8b926ad6b5c186083511ee0c399523222475d9b1578e2085fc653e935f9bc

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
