FROM aclemons/slackware:current@sha256:1e3e8a96e09f4a3dcbf5a4344b023d022e56de74b746a7d39dfbce6e0965a692

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
