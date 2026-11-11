FROM aclemons/slackware:current@sha256:6e248a5873d9df1f188c4daa8d4827c9b89146cba9d207999a0598a8d9064018

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
