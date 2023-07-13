FROM aclemons/slackware:current@sha256:f49183b0697cf1055d60bd492bac5a9779f35a149a7f81da8c82e04a1ce6fcdb

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
