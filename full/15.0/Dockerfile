FROM aclemons/slackware:15.0@sha256:9b1b9baaaf0bb85bff77d1a350d22b89554e284e8cd7fe635d4b874dd8e33dad

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
