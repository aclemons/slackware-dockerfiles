FROM aclemons/slackware:current@sha256:9d9a7a30acb08f74553b0b99a263a34ab30cb751111fd849c857a6a6e5f5aa69

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
