FROM aclemons/slackware:current@sha256:f09e47d09db59378978678bee724a1dcbd71164b8ecb4f7adc339e8484b2022d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
