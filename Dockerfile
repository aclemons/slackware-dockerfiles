ARG base_image=aclemons/slackware:latest
# hadolint ignore=DL3006
FROM $base_image

COPY scripts/install_all.sh /

ARG mirror
RUN bash /install_all.sh "$mirror" && rm /install_all.sh
