FROM aclemons/slackware:current@sha256:51ed774d4920d954d3afa39686ffabb13780bc42e20be5a7c2d2d960301e9d9b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
