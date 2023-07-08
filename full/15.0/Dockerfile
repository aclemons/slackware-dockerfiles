FROM aclemons/slackware:15.0@sha256:5a594b9b9d6c28754edfe71de7b59689cb8cc40e39e527399b1cab82e5cd6a91

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
