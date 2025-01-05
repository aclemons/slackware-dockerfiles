FROM aclemons/slackware:current@sha256:b6b7c9152b8063174fbb49740782d57a22565dbdf255ae1c8eccfe0867c5618a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
