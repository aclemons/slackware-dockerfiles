FROM aclemons/slackware:15.0@sha256:7114026f105f9751b3abd87abab6eee93f602b32eb30e406f41f4b2751141884

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
