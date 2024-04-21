FROM aclemons/slackware:15.0@sha256:4f52bfa9387d71ac29392d386ea41a017a8dbedfa7b0824bdef90b1b83d90183

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
