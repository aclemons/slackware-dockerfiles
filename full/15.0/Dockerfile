FROM aclemons/slackware:15.0@sha256:d6ddbee29b73b1d574293573238f303504c220f84008a62494f0b19caa305c9f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
