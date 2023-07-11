FROM aclemons/slackware:current@sha256:8f95fdd9e16eb55fd325d93a0b1f95afef7985f06f8a923b8c497aaf90c5845b

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
