FROM aclemons/slackware:current@sha256:d4d61fe99ed0853b29050342a4296f35673980def5ddb7dccf3396de2438ed41

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
