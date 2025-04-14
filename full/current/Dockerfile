FROM aclemons/slackware:current@sha256:c81d19bf378b27fca13447abb5af6b868d7c7c366c7ac198ac7fd188dfa17966

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
