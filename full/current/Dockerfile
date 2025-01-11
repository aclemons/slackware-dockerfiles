FROM aclemons/slackware:current@sha256:5f0e8012353eb84e72d81ed720cffd49819e9b7c6d6e0ef93ce741867747d7d9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
