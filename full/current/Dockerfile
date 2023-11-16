FROM aclemons/slackware:current@sha256:77037810b39d2cb0b2dbe4e8bacf0332af3309fd976338c68dd43a907a096d74

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
