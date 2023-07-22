FROM aclemons/slackware:15.0@sha256:65fa50a3f4f89823d7290fd7a51fb9153c257dad86ac9662fec034712f09c723

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
