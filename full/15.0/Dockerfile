FROM aclemons/slackware:15.0@sha256:12b446b9a19651a78caa465e7a71099ea2bc31c7082ae84683a6e085a540c2ed

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
