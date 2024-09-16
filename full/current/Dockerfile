FROM aclemons/slackware:current@sha256:cf4b9faa5f4255705ad8c74bbfad6345cfb9ce4ac4e5431c3fdfd95eb12d5255

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
