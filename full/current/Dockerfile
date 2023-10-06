FROM aclemons/slackware:current@sha256:9b7d9d973b22563ed226fef02aa66279893c3ad909bcd79fbf7db329afedb9bd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
