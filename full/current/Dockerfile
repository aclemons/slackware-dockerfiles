FROM aclemons/slackware:current@sha256:12babada32c4b0958650c78dac7ea48c22b15c50815d11c21b5e61fcb99a3c3e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
