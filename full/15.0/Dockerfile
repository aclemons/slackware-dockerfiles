FROM aclemons/slackware:15.0@sha256:4f7d2a0a65ab072d25c9a12f00cbd4f92edfa689da229e6f7cc5a3f0b15b00f4

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
