FROM aclemons/slackware:15.0@sha256:c3aef1827c177c50a15c6a04d96b57dfce3a647d9aa8ac7042c426cacdc365a9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
