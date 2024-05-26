FROM aclemons/slackware:current@sha256:55cf67e61662b32fed06c7ec0e1cd56d8c75dfa681c1a4791979b772f6a67bd0

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
