FROM aclemons/slackware:current@sha256:09968776eb83a2efb8659bc1171616d4e462be490907ef92f062b8a332ad93af

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
