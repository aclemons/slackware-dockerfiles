FROM aclemons/slackware:current@sha256:24607e7b166e874746b231a86f85cccb43a3cc030516effbf3d5b8784a8331f1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
