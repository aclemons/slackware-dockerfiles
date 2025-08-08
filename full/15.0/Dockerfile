FROM aclemons/slackware:15.0@sha256:a1d801d00bde6df0c1fc639a5c2c62cb4373667f669265b39edebacf76268791

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
