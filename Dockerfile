ARG base_image=vbatts/slackware:14.2
FROM $base_image

RUN echo "Using base image $base_image"

COPY scripts/install_all.sh /

ARG mirror
ARG base_image=vbatts/slackware:14.2
RUN bash /install_all.sh "$base_image" "$mirror"

RUN rm /install_all.sh #!COMMIT
