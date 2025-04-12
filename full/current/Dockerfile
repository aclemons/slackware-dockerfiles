FROM aclemons/slackware:current@sha256:c55a552fad0051fa1e00d2bf7c13d2805bb233b9e6dea2357d9c148f23cbb1cf

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
