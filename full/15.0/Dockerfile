FROM aclemons/slackware:15.0@sha256:d1bb400c095f0131ee7f46096a0585cfdefb4686fe1f547a8402724c2a5182bd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
