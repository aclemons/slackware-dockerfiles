FROM aclemons/slackware:current@sha256:6a147d2a2778af5b912a4805dad064cd4f027e5e2f1a2d91634b3bb2cf01eb61

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
