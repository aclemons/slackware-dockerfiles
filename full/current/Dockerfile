FROM aclemons/slackware:current@sha256:7994313c3026fa773702a2cf41ba120b69a847820c662997dc7922dc3e0f3569

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
