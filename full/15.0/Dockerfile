FROM aclemons/slackware:15.0@sha256:2b21d23c4809cec6453a05e31d437e047896665676c80514274520a5027ce5bc

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
