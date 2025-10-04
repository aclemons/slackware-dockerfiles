FROM aclemons/slackware:15.0@sha256:4c6ce084760ca5d506ea220166b4b60bec0b8b7f99209ad23b90d545c7b6c63b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
