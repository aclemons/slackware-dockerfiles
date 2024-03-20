FROM aclemons/slackware:current@sha256:2ecc3620d15aa0d9f2845a43bbe53ead7876ad65633ff3b04c9710c0226f80a0

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
