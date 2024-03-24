FROM aclemons/slackware:15.0@sha256:e796dc0baee23e7ab4834f00a33693d804f235fb547f6a8ee723b7d3d765511e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
