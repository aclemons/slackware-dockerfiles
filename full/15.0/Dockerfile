FROM aclemons/slackware:15.0@sha256:7c655a178b78b2c729b0e9753d24745897d278d7a775ebe66e17ae6abf255c3f

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
