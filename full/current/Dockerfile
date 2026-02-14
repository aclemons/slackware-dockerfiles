FROM aclemons/slackware:current@sha256:40a566078115b081996f16621303251eb7e09da4bec6b89355941f39ae9eb84b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
