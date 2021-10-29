ARG base_image=vbatts/slackware:14.2
ARG use_local_mirror=false
ARG local_mirror

FROM $base_image as base
RUN echo "Using base image $base_image"
COPY scripts/install_all.sh /

FROM base as using-mirror-false
ARG base_image
ARG local_mirror
RUN bash /install_all.sh "$base_image"

FROM base as using-mirror-true
ARG base_image
ARG local_mirror
RUN echo "Using local mirror $local_mirror"
COPY "$local_mirror" /mirror
RUN bash /install_all.sh "$base_image" /mirror

FROM using-mirror-${use_local_mirror} AS final
RUN rm /install_all.sh #!COMMIT
