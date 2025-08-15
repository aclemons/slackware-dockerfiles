FROM aclemons/slackware:current@sha256:b87963402f235e4943031ca2fe1e313bf9a26e11db71c12b77d3dabfd899bd1c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
