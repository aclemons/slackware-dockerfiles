FROM aclemons/slackware:15.0@sha256:011cbf23262c12dac43dae8163b4e24af080feed7d90aefe67fa3670d214f5ae

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
