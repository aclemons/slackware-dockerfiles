ARG base_image=aclemons/slackware:latest
# hadolint ignore=DL3006
FROM $base_image

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
