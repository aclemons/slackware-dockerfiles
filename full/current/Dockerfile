FROM aclemons/slackware:current@sha256:bdcd29705d9269c0dec0262a932c053806d63a5117e4fc2559373f5abbbaf9ea

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
