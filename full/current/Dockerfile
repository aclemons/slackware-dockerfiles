FROM aclemons/slackware:current@sha256:1b00fbc29260dc8d99a988594da40855c36ff09665ccb075e1a0f142731b986a

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
