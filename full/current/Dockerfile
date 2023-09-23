FROM aclemons/slackware:current@sha256:86e2cc4091373216f1feb550ed4d35a8b779e4543c1d4ecec8a4fe0429dc4598

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
