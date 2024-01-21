FROM aclemons/slackware:current@sha256:014759a0468d061ca0c9b12368b50b80ed9366c267f2f499706e294c2895fa83

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
