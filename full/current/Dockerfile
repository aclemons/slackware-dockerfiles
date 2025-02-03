FROM aclemons/slackware:current@sha256:9e2c3980ca521179b4f3d021fa2bcb01d33279568134e107a436cfffa26a1bcf

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
