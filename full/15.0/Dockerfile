FROM aclemons/slackware:15.0@sha256:2cec39424f1bb142b09ba01ef70fe246fa3910bd6b604e15f7febb1541dcfe1b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
