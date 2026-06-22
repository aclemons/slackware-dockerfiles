FROM aclemons/slackware:current@sha256:fdde97566f5dcd9e0b3df9fafd41215aeb4527254a23d6e4cf543a3e2bbd872b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
