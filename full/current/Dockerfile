FROM aclemons/slackware:current@sha256:c81d73de38b1441e10f65403da5954197dce4a37b3b0bfbbfc7060681b384481

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
