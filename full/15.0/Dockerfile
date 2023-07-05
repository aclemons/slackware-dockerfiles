FROM aclemons/slackware:15.0@sha256:5fc8c49974487af0ea93724ea8075069693aa144128d51abf9c002e280edbe77

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
