FROM aclemons/slackware:15.0@sha256:53fafa513d74c5a4f16a7159fe00d833e67b5dcfe7ab9621f8e20cbc114896e9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
