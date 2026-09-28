FROM aclemons/slackware:current@sha256:1447cb1beac4408104b39713d383e63fd4c633cef5b984df58d120800b7ddc78

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
