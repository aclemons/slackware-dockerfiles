FROM aclemons/slackware:current@sha256:ce7a435b762353be7d26cbfdf110c551c21e65844fbee7bcdfe3ed9c989e9082

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
