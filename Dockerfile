ARG base_image=vbatts/slackware:14.2
FROM $base_image

ARG base_image
RUN echo "Using base image $base_image"

ARG local_mirror
RUN echo "Using local mirror $local_mirror"

COPY "$local_mirror" /mirror
COPY scripts/install_all.sh /
RUN bash /install_all.sh "$base_image" /mirror
RUN rm /install_all.sh
RUN rm -rf /mirror #!COMMIT
