FROM aclemons/slackware:15.0@sha256:822c12d00f9a1de371529561a26d93059b249069bcdcb4e7ed45402cddeebe6b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
