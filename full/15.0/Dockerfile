FROM aclemons/slackware:15.0@sha256:acce114b84074cbde982da1d60b7b822c0e7c82575fe2a3280d71c6e99ded442

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
