FROM aclemons/slackware:current@sha256:5dc545a06d4458a67ef679993a83de90b68d4afa784b4124e1e55c37674a5b52

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
