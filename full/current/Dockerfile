FROM aclemons/slackware:current@sha256:cdd0ec2d7147f3b4c57105af1bbfa8938a259d3e6d5f61bc266b62774b12f54e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
