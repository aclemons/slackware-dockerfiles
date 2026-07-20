FROM aclemons/slackware:current@sha256:43bcc2b33b8bc3415c0d127d7d90b9b7b8bce11eb6c6fda2ab4723c52790075e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
