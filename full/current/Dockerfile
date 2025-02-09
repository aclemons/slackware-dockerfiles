FROM aclemons/slackware:current@sha256:cb7887f9ed1dfc9a63180caa49b24e2ba1f4a9dd9c2205f4875b0264a51bcafe

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
