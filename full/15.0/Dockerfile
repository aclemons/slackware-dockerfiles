FROM aclemons/slackware:15.0@sha256:d9fcbd21ceeae9e5d54019204145dd6557da94ee4887175ed9fa07e155937f91

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
