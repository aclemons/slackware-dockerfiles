FROM aclemons/slackware:current@sha256:0f66ea05ed21be246ebcacac5d67d66de95dd808a6ee56320555e44a7d853d81

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
