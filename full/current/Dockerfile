FROM aclemons/slackware:current@sha256:8edcb810a7c42794446f147d49a13871e6b5ed4b30d0b6d3488a39121e318069

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
