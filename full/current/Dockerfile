FROM aclemons/slackware:current@sha256:6a09670169b5c829b698795db5d78e2a413a656d14f455f9567a4e8f8de4d474

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
