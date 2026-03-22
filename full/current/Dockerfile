FROM aclemons/slackware:current@sha256:20514f10f78dc5330be6fcfafa34aca54a69201ec1bfb70651bc1baea5412d8f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
