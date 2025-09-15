FROM aclemons/slackware:15.0@sha256:34de3ba5873f48440ce2d14e13b2392a8eda51da3c329a9739f488839761f5e6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
