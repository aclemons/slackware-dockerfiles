FROM aclemons/slackware:current@sha256:a2a2aa99ce5f318e1475895fb7255d89c994e6a2074fe31fd4fddd780808de96

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
