FROM aclemons/slackware:current@sha256:144d00aa43533ae4ce3595b27ab1951703a305bd2ac768891946a55370b8aff6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
