FROM aclemons/slackware:current@sha256:d23511240cca59219737848d4bf9e809c5a724ebfdb28829c469d9e3ea40cb5d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
