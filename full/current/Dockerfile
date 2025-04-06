FROM aclemons/slackware:current@sha256:a14fce3e3eff390675d9cbf1093dbf23f73b41851b0bc421430e73eab1de9775

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
