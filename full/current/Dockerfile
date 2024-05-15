FROM aclemons/slackware:current@sha256:027c53043289c98cdf2296c963649f00f931533b546213798d8d88091349a974

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
