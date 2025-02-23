FROM aclemons/slackware:current@sha256:660886904323a60b25a5465eea70db4d1bba0f6135435b898585ecc7351961e1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
