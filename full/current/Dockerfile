FROM aclemons/slackware:current@sha256:e4df6e1dc6ce78cfc8b36245a5ecce9dce0331a5b7bb0cc851806384aea51b2b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
