FROM aclemons/slackware:15.0@sha256:da7b522966951ee2578990f3457c726a9e5b71f8eff33f36670d79b9d7d90368

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
