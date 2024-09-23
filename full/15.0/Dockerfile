FROM aclemons/slackware:15.0@sha256:077960c708e3b654df63f9e6b0c7a8bf2cc351952ce5e99e574c903f947acf52

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
