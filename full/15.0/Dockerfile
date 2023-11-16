FROM aclemons/slackware:15.0@sha256:26d7d9bf947a39ce56b3f3456d2db00956d92eb715956140646f522bc249faaa

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
