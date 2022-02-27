ARG base_image=aclemons/slackware:14.2-x84_64-full
# hadolint ignore=DL3006
FROM $base_image

COPY scripts/install_all.sh /

ARG base_image=aclemons/slackware:14.2-x84_64-full
ARG mirror
RUN bash /install_all.sh "$base_image" "$mirror" && rm /install_all.sh
