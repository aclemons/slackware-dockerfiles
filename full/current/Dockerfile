FROM aclemons/slackware:current@sha256:4c2dc2ebd17563bd682d579657d68e02ff96cb1b45f6f120226935f91d56ef62

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
