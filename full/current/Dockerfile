FROM aclemons/slackware:current@sha256:2e83d5fe8c5328f0727abb97e10b1034dd9914749c8b315ae9ac680067258635

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
