FROM aclemons/slackware:current@sha256:9b78345ca55a2e214d5ee20741c8908fa4126d838d5c1e5092909cfe36c54b25

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
