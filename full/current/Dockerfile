FROM aclemons/slackware:current@sha256:b97a10c9a1a619422dd72df8bf76c07d2958f42a8fc4bdf6c24a4ccec52a5959

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
