FROM aclemons/slackware:current@sha256:aa2620354b06cf3715153aa7b4bcb11bad6d37f7883b7a237b978771dab9eab9

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
