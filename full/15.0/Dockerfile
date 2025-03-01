FROM aclemons/slackware:15.0@sha256:732b961f67e859999d23518378a2cb8f2413884cef607a6ee1489a3cfc2baa2c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
