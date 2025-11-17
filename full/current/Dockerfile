FROM aclemons/slackware:current@sha256:cfc4bb49edea2971f3bf87621979fd935600bf9d871426cb8260e98f357b3e04

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
