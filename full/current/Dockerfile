FROM aclemons/slackware:current@sha256:f6c1127b4448e88c8ababd35a35bb2f1675aac0da30e929bff903cc921ca422b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
