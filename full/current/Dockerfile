FROM aclemons/slackware:current@sha256:38de587374046e479daa61f290d98b31359773e5047cf2170325c837e0aa4df1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
