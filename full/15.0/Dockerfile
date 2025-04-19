FROM aclemons/slackware:15.0@sha256:8265d7fe5d60675b096b94b432343e4b7c03a55e5714b18756d1172dfd17b0b7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
