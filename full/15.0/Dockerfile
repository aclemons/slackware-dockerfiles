FROM aclemons/slackware:15.0@sha256:09cecdb18eb854a496fdc6f0609f6991b550fcd88dc5053e3081103a4e9a092e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
