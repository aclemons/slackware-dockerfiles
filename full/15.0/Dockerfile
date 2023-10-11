FROM aclemons/slackware:15.0@sha256:95d73a11647f116cfa1d02ead75f3b00354b214f2c38ff574180214015f5ffb8

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
