FROM aclemons/slackware:15.0@sha256:796b36e87ae912a259bbc6ed18534d7176fb607f89c9d6573e0d70878b6a8d3c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
