FROM aclemons/slackware:current@sha256:d847bf90fc180e1114ed8778c7ffd39e00af9dd2e7bc2588292965a4ada7afaf

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
