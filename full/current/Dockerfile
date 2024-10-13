FROM aclemons/slackware:current@sha256:7b7071350cee7abe8a80dd835b75a7718a7a91f8b8e691ed10705a29ffecc876

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
