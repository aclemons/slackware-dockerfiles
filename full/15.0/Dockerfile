FROM aclemons/slackware:15.0@sha256:e9bd37749f52b413752c88808174f9817627fa9fa42c0c89f18af1bb770f27a1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
