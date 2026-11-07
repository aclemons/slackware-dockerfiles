FROM aclemons/slackware:current@sha256:3cce42b2e349489846ff8d3ccde9cc02ff52d1e9cd7033d51cdeb2a54698ef1c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
