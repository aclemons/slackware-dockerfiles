FROM aclemons/slackware:15.0@sha256:325a459516790671f62fb0455a74fe3fea1d5ced5260c8a9e620ae04001b2f5e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
