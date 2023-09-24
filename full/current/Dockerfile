FROM aclemons/slackware:current@sha256:11d9ef59eb4c8a09387d02f7a0947075f18391ee895c3f7de57cc74b58886e36

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
