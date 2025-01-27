FROM aclemons/slackware:15.0@sha256:4f34d38cd529e1b5ce3566023d3e8d4ef6db85a1b58a7bfbd74e083c4ddfa162

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
