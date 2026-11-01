FROM aclemons/slackware:current@sha256:52f73d76f69b45b69911e61a6b41f59587950dfd9b7bd65398c8b2426b8f7fda

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
