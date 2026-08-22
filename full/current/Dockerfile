FROM aclemons/slackware:current@sha256:f7617dd39deb6a5361a392bbb3a1a1008d83bf10923dcbde6ce9ab194466b608

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
