ARG base_image=vbatts/slackware:14.2
FROM $base_image

ARG base_image
RUN echo "Using base image $base_image"

COPY scripts/install_all.sh /
RUN bash /install_all.sh
RUN rm /install_all.sh