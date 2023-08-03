FROM aclemons/slackware:current@sha256:3e050b84cefd6ebe6c1c8c1607113f7e788046b77cc664c0d879a2e7c8cbc1d0

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
